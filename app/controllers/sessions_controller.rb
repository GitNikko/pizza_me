class SessionsController < ApplicationController
  def new
  end
  
  def create
    if auth = request.env["omniauth.auth"]
      user = User.find_or_create_by_omniauth(auth)
      if user.save
        update_profile_image(user, auth["info"]["image"])
        log_in user
        remember(user)
        redirect_to root_path
      else
        flash[:danger] = "Account already exists with this email address"
        redirect_to login_path
      end
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          log_in user
          params[:session][:remember_me] == '1' ? remember(user) : forget(user)
          redirect_back_or root_path
        else
          message = "Account not activated. "
          message += "Check your email for the activation link."
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
      end
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
    flash[:success] = "You are now logged out"
  end
  
  private
  def update_profile_image(user, image)
    if user.profile_image != image
      user.update_attribute(:profile_image, image)
    end
  end
   
end
