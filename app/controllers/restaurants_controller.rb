class RestaurantsController < ApplicationController
  include RestaurantsHelper  
  def new
    @restaurant = Restaurant.new 
  end
  
  def create
    @restaurant = Restaurant.new(params[:restaurant])
  end

  def index   
    #@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    #@spots = @client.spots_by_query('Pizza near ' + params[:search] + ' Sydney', :types => ['pizza'])
    #@results = @spots.delete_if { |a| a.rating.nil? }
     #@results = search("pizza", params[:search] + ) 
     
    @results = search("pizza", params[:search] + ", " + params[:state])
    @sort_by_rating = @results["businesses"].sort_by { |a| a["review_count"]}
    @recently_reviewed = Review.order(:created_at).take(3)
  end

  def show 
    #@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    #@spot = @client.spot(params[:id])
    @spot = business(params[:id])
    @yelp_reviews = reviews(params[:id])
    
    restaurant_attributes
    
    @restaurant = Restaurant.find_by(yelp_id: params[:id])
    if @restaurant.nil?
     @restaurant = Restaurant.create(:name => @spot["name"], :yelp_id => params[:id])
    end
    
    @reviews = @restaurant.reviews
    @review = current_user.reviews.build if logged_in?  
  end
end
