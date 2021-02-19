class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login

  end


  def create
    #create a session here 
  end


 
  def home
  end

  #logout
  def destroy
    session.clear
    redirect_to '/'
  end

  
end
end