class SessionsController < ApplicationController

  def new
    @user = User.new
    render :login

  end

  def create
    @user = User.fin_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to books_path
    else 
      render :new
    end
    
  end

  def home
  end

  #logout
  def destroy
    session.clear
    redirect_to '/'
  end


end