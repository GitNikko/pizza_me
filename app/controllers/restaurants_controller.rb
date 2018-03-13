class RestaurantsController < ApplicationController
  include RestaurantsHelper  
  def new

    
  end

  def index
      
    #@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    #@spots = @client.spots_by_query('Pizza near ' + params[:search] + ' Sydney', :types => ['pizza'])
    #@results = @spots.delete_if { |a| a.rating.nil? }
     #@results = search("pizza", params[:search] + ) 
     
    @results = search("pizza", params[:search] + ", NSW")
  end

  def show
       
    #@client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    #@spot = @client.spot(params[:id])
    @spot = business(params[:id])
    @reviews = reviews(params[:id])
    restaurant_attributes
    
    restaurant = Restaurant.find_by(yelp_id: params[:id])
    if restaurant.nil?
     Restaurant.create(:name => @spot["name"], :yelp_id => params[:id])
    end
      
  end
end
