class SessionsController < ApplicationController
  def new
  end
  
  def create
    if auth = request.env["omniauth.auth"]
      @user = User.find_or_create_by_omniauth(auth)
      if @user.profile_image != auth["info"]["image"]
        @user.update_attribute(:profile_image, auth["info"]["image"])
      end
      session[:user_id] = @user.id
      redirect_to root_path
    else
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to '/'
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
  
end
