class ApplicationController < ActionController::Base
	protect_from_forgery
	def after_sign_in_path_for(current_user)
	  authenticated_root_path
	end
end
