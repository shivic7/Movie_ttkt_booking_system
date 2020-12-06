class MovieController < ActionController::Base
	require 'csv'
	skip_before_action :verify_authenticity_token, :only => [:calculate_amount]
	def add_movie
		if params[:mname].present? && params[:mposter].present?
			movie = Movie.create(name: params[:mname], image_url: params[:mposter], is_active: params[:is_active])
			if movie.present? && params[:mdate].present? && params[:mslots].present?
				m_slots = params[:mslots].split(',')
				m_slots.each do |slot|
					MovieDetail.create(movie_id: movie.id, movie_date: params[:mdate], movie_time: slot.strip, first_class_seat: 30, second_class_seat: 40, third_class_seat: 30)
				end
			end
			redirect_to '/admin', notice: 'Movie added'
		end
	end

	def view_movie
		if params[:movie_id].present?
			@movie = Movie.find(params[:movie_id])
			@movie_detail = @movie.movie_detail
		end
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

	def edit_movie
		@movie = Movie.find(params[:movie_id])
		@movie_detail = @movie.movie_detail
		if params[:mname].present?
			@movie.update_attributes!(name: params[:mname], is_active: params[:is_active])
			dtl = @movie_detail.select{|a| a["id"] == params["movie_detail_id"].to_i}[0]
			dtl.update_attributes!(movie_date: params[:mdate], movie_time: params[:mtime],first_class_seat: params[:mfcs], second_class_seat: params[:mscs], third_class_seat: params[:mtcs])
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
			# debuggerc
			@movie_detail = @movie.movie_detail
		end
	end

	def calculate_amount	
		amount = 0 
		msg = "Ticket not booked"
		if params[:movie_id].present?
			movie_detail = MovieDetail.where("movie_id = #{params[:movie_id]} and movie_date = '#{params[:movie_date]}' and movie_time = '#{params[:movie_time]}'").last
			params[:mfcs] = params[:mfcs].to_i
			params[:mscs] = params[:mscs].to_i
			params[:mtcs] = params[:mtcs].to_i
			if params[:mfcs] <= movie_detail.first_class_seat && params[:mscs] <= movie_detail.second_class_seat && params[:mtcs] <= movie_detail.third_class_seat 
				movie_detail.update_attributes!(first_class_seat: movie_detail.first_class_seat - params[:mfcs], second_class_seat: movie_detail.second_class_seat - params[:mscs], third_class_seat: movie_detail.third_class_seat - params[:mtcs])
				amount = params[:mfcs] * 300 + params[:mscs] * 200 + params[:mtcs] * 150
				msg = "Ticket booked successfully."
			end
		end
		render json:{success: true, msg: msg, amount: amount}
	end
end
