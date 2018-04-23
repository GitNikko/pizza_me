class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    @review = current_user.reviews.build(review_params)
    @review.restaurant_id = params[:restaurant_id]
    if @review.save
      flash[:success] = "Review submitted!"

      redirect_to request.referrer || root_url
    else
      redirect_to request.referrer || root_url
      flash[:danger] = @review.errors.full_messages.to_sentence
    end
  end

  def destroy
    @review.destroy
    flash[:success] = "Review deleted"
    redirect_to request.referrer || root_url
  end

  private

    def review_params
      params.require(:review).permit(:content, :rating, :picture)
    end

    def correct_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to root_url if @review.nil?
    end

end
