class AdminController < ActionController::Base
	before_action :authenticate_admin!
	def index
		@movies = Movie.all
	end
end
