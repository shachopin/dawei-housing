class UsersController < ApplicationController
  before_action :setup_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "You are now registered!"
      session[:user_id] = @user.id
      redirect_to bugs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your profile was successfully updated"
      redirect_to bugs_path
    else
      render :edit  
    end
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :time_zone)
  end

  def setup_user
    @user = User.find(params[:id])
  end

  def require_same_user  # if not logged in, also will not allow here
    if current_user != @user
      flash[:warning] = "You are not allowed to do that"
      redirect_to login_path
    end
  end

end