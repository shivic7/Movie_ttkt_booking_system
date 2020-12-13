class MovieController < ActionController::Base
	require 'csv'
	before_action :authenticate_admin!, :only => [:add_movie, :view_movie, :delete_movie, :download_movie_report]
	skip_before_action :verify_authenticity_token, :only => [:calculate_amount]
	def add_movie
		if params[:mname].present? && params[:mposter].present?
			Movie.new_movie(params)
			redirect_to '/admin', notice: 'Movie added'
		end
	end

	def view_movie
		if params[:movie_id].present?
			@movie = Movie.find(params[:movie_id])
			@movie_detail = @movie.movie_details
		end
	end

	def edit_movie
		@movie = Movie.find(params[:movie_id])
		@movie_detail = @movie.movie_details
		if params[:mname].present?
			MovieDetail.edit_movie(params,@movie,@movie_detail)
			redirect_to "	/edit-movie/#{params[:movie_id]}"
		end
	end

	def delete_movie
		movie = Movie.find(params[:movie_id])
		movie.update_attributes!(is_active: 0)
		redirect_to '/admin'
	end

	def book_ticket
		if params[:movie_id].present?
			@movie = Movie.find(params[:movie_id])
			@movie_detail = @movie.movie_details
		end
	end

	def calculate_amount	
		amount,msg,pass = MovieDetail.get_amount(params)
		render json:{success: true, msg: msg, amount: amount, pass: pass}
	end

	def download_movie_report
		row_data =  params[:movie_detail]
		movie = JSON.parse(params[:movie])
		data =  JSON.parse(row_data)
		if !data.nil? && data.present?
			@csv_data = CSV.generate do |csv|
				csv << ["Movie Name","Movie Date","Movie Time Slot","First Class Seat","Second Class Seat","Third Class Seat"]
				data.each do |t|
					csv << [movie["name"],t["movie_date"],t["movie_time"],t["first_class_seat"],t["second_class_seat"],t["third_class_seat"]]
				end
			end
			send_data @csv_data, :type => 'text/csv; charset=iso-8859-1; header=present', :disposition => "attachment; filename=movie_data.csv"
		end
	end
end
