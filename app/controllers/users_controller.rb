class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    #This object is required to provide the @user argument in the form_for
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Sign up successful!"
      redirect_to '/'
    else
      render 'new'
    end
  end
  
  private
    #This limits the data that will get submitted through the params hash.
    #Permitting only the listed attributes belonging to the :user hash inside params.  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
  
end
