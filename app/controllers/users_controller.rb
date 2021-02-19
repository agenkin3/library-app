class UsersController < ApplicationController
  before_action :require_authorization, only: [:edit, :update]


  def index
    @user = User.all
  end

  #loading the signup form  
  def new
    @user = User.new
  end
  
  def show 
    @ratings= Rating.all
  end

  #signup
  def create
  @user = User.new(user_params)
  if @user.save
    #login the user
    #set the session
    session[:user_id] = @user.id
    flash[:notice] = "Account successfully created!  Welcome, #{@user.username}!"
    redirect_to @user #can you use books_path why or why not
  else
    flash[:error] = "Error: User not created: " + @user.errors.full_messages.to_sentence
    render :new
  end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "#{@user.username} successfully updated!"
    else
      flash[:error] = "Update unsuccessful: " + @user.errors.full_messages.to_sentence
    end
    redirect_to @user
  end

  def destroy
    current_user.takeover_projects_from(@user)
    @user.delete
    flash[:notice] = "Successfully deleted #{@user.username}'s account."
    flash[:alert] = "By the way, you now own all #{@user.username}'s projects!'"
    redirect_to users_url
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  
  def require_authorization
    unless current_user.can_edit_user? @user
      flash[:alert] = "You are not authorized for that function."
      redirect_back(fallback_location: root_url)
    end
  end

  end
  