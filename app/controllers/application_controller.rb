class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout!
    session[:session_token] = nil
  end

  def logged_in?
    !current_user.nil?
  end

  def current_user
    @current_user ||=
      User.find_by(session_token: session[:session_token])
  end

  def ensure_login
    redirect_to new_session_url unless logged_in?
  end
end
