class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "You've logged in!"
      redirect_to bugs_path
    else
      flash.now[:warning] = "There is something wrong with your username or password"
      render :new
      # use params[:username]||'' for username, but '' for password, use flash.now and render :new. 
      # This way if the username is wrong, the old value will be kept
      # no need for password field. Who wants to see dots anyway

    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You've logged out!"
    redirect_to login_path
  end
end