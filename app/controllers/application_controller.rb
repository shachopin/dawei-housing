class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :logged_in_as_shachopin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def logged_in_as_shachopin?
    logged_in? && current_user.username == "shachopin"
  end

  def require_user
    if !logged_in?
      access_denied
    end
  end

  def require_shachopin_user
    if !logged_in_as_shachopin?
      access_refused
    end
  end

  def access_denied
    flash[:warning] = "You must be logged in to do that"
    redirect_to login_path
  end

  def access_refused
    flash[:warning] = "You must be the host to do that"
    redirect_to tenants_path(show_application_only: true)
  end

end
