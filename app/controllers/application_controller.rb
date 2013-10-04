class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

#make sure that we can use the basket within view as well as controller
  helper_method :basket

  #Because Basket is everywhere on the site (you want 
  	#the basket on the products page or order page), we put it here

def basket
if session[:basket].nil?
	#basket is an empty list, using set because we don't want to add the same thing twice(an empty array[] allows you to add the same thing twice)
	session[:basket] = Set.new
end
#actually give them the basket
session[:basket]
end

helper_method :current_user

def current_user
	if session[:user_id].present?
		User.find(session[:user_id])
	end
end

end
