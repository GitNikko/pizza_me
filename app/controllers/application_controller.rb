class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  # Makes the content of the SessionsHelper available in all controllers
  include SessionsHelper
  
  private
  # Moved the logged_in_user? method here so it can also be used by the reviews_controller
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in"
      redirect_to login_url
    end
  end
  
end
