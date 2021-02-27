class ApplicationController < ActionController::Base
  include ApplicationHelper
  # protect_from_forgery with: :exception
  # helper_method :current_user
  # before_action :authenticate_user!
#what does the exclamation point do 
#what is the difference between private and helper?
  # def after_sign_in_path_for(resource)
  #   request.env['omniauth.origin'] || root_path
  # end

private
 
# def current_user
# @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
# end

def require_authentication
  if !logged_in?
  redirect_to root_url
end
end

end