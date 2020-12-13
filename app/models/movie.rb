class Movie < ApplicationRecord
	has_many :movie_details
	def self.new_movie(params)
		movie = Movie.create(name: params[:mname], image_url: params[:mposter], is_active: params[:is_active])
		if movie.present? && params[:mdate].present? && params[:mslots].present?
			m_slots = params[:mslots].split(',')
			m_slots.each do |slot|
				movie.movie_details.create(movie_date: params[:mdate], movie_time: slot.strip, first_class_seat: 30, second_class_seat: 40, third_class_seat: 30)
			end
		end
	end
end
