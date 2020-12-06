class Movie < ApplicationRecord
	has_many :movie_detail, :class_name => "MovieDetail", :foreign_key => "movie_id"
end
