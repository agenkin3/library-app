class SessionsController < ApplicationController

  def new
    redirect_to books_path
  end

end
#   def create
#     #create a session here 
#     @user = User.find_by(email:params[:user][:email])
#     if @user && @user.authenticate(params[:user][:password])
#       session[:user_id] = @user.id
#       redirect_to user_path
#     else
#       redirect_to '/' #binding.pry#redirect_to '
#   end
# end

#   #logout
#   def destroy
#     session.clear
#     redirect_to '/'
#   end

#   private

#   def user_params
#     params.permit(:name, :email, :password)
#   end

#   def auth
#     request.env['omniauth.auth']
#   end

# end