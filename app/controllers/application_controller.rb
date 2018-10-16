class ApplicationController < ActionController::Base

  # prevent CSRF by bounding hidden tokens within form fields to users session
  protect_from_forgery with: :exception

  private

  def confirm_logged_in
    unless session[:user_id] && session[:expires_at] > Time.current
      flash[:notice] = "Please log in."
      # redirect_to prevents requested action from running
      redirect_to(access_login_path)
    end
  end

end
