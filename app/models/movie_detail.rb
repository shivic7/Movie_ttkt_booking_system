class MovieDetail < ApplicationRecord
	belongs_to :movie

	def self.get_amount(params)
		amount = 0 
		msg = "Ticket not booked"
		pass = 0 
		if params[:movie_id].present?
			movie_detail = MovieDetail.where("movie_id = #{params[:movie_id]} and movie_date = '#{params[:movie_date]}' and movie_time = '#{params[:movie_time]}'").last
			params[:mfcs] = params[:mfcs].to_i
			params[:mscs] = params[:mscs].to_i
			params[:mtcs] = params[:mtcs].to_i
			if params[:mfcs] <= movie_detail.first_class_seat && params[:mscs] <= movie_detail.second_class_seat && params[:mtcs] <= movie_detail.third_class_seat 
				movie_detail.update_attributes!(first_class_seat: movie_detail.first_class_seat - params[:mfcs], second_class_seat: movie_detail.second_class_seat - params[:mscs], third_class_seat: movie_detail.third_class_seat - params[:mtcs])
				amount = params[:mfcs] * 300 + params[:mscs] * 200 + params[:mtcs] * 150
				user = User.create(name: params[:user_name])
				user.orders.create(movie_date: params[:movie_date], movie_time: params[:movie_time], fc_seat: params[:mfcs], sc_seat: params[:mscs], tc_seat: params[:mtcs], tkt_fare: amount)
				msg = "Ticket booked successfully."
				pass = params[:mfcs] + params[:mscs] + params[:mtcs]
			end
		end
		return amount, msg, pass
	end

	def self.edit_movie(params,movie,movie_detail)
		movie.update_attributes!(name: params[:mname], is_active: params[:is_active])
		dtl = movie_detail.select{|a| a["id"] == params["movie_detail_id"].to_i}[0]
		dtl.update_attributes!(movie_date: params[:mdate], movie_time: params[:mtime],first_class_seat: params[:mfcs], second_class_seat: params[:mscs], third_class_seat: params[:mtcs])
	end
end
