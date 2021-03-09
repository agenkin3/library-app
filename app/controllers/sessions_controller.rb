class SessionsController < ApplicationController

  def new
  end

  def omniauth
    user = User.create_from_omniauth(auth)

    if user.valid?
      session[:user_id] = user.id
      redirect_to new_rating_path
    else
      flash[:message] = user.errors.full_messages.join("")
      redirect_to ratings_path
    #block only runs ufit doesn't find by, only runs if create by  
      #provider = auth['provider']
    #name = auth['info']['name']
  end
end

 def create
  #finding the user by the email they passed in
  u = User.find_by_email(params[:email])
  #check that you are able to authenticate them 
  #the authenticate method comes from has secure password
  #taking it a string and making sure it matches the password digest
  if u && u.authenticate(params[:password])
    #line that actually logs in user
    session[:user_id] = u.id
    redirect_to user_path(u)
  else
    flash[:message] = 'Invalid credentials. Please try again'
    redirect_to '/login'
  end
end 

def destroy
  session.delete([:user_id])
  redirect_to '/login'
end




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

private

#   def user_params
#     params.permit(:name, :email, :password)
#   end

def auth
  request.env['omniauth.auth']
end

end