class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews.paginate(page: params[:page])
    @show_restaurant_name = true
  end
  
  def new
    #This object is required to provide the @user argument in the form_for
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    @user.profile_image = "https://cdn4.iconfinder.com/data/icons/food-and-drink-1-2/64/pizza-food-italian-meal-256.png"
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile successfully updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
    #This limits the data that will get submitted through the params hash.
    #Permitting only the listed attributes belonging to the :user hash inside params.  
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    # Before filters
    
    # Confirms the correct user
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    # Confirms an admin user
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
