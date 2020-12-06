class HomePageController < ActionController::Base
	def index
		@movies = Movie.where("is_active = 1")
	end
end
