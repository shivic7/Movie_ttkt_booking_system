class AdminController < ActionController::Base
	def index
		@movies = Movie.all
	end
end
