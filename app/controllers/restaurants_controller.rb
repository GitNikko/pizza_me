class RestaurantsController < ApplicationController
  include YelpSetup
  
  def new
    @restaurant = Restaurant.new 
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
  end

  def index   
    @results = search("pizza", params[:search] + ", " + params[:state])
    @sort_by_rating = @results["businesses"].sort_by { |a| a["review_count"]}
    @recently_reviewed = Review.order(:created_at).take(3)
  end

  def show 
    @spot = business(params[:id])
    @yelp_reviews = reviews(params[:id])
    
    @restaurant = Restaurant.find_by(yelp_id: params[:id])
    if @restaurant.nil?
     @restaurant = Restaurant.create(:name => @spot["name"], :yelp_id => params[:id])
    end
    
    @reviews = @restaurant.reviews
    @review = current_user.reviews.build if logged_in?  
  end
  

end
