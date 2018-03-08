class RestaurantsController < ApplicationController
  def new

    
  end

  def index
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @spots = @client.spots_by_query('Pizza near ' + params[:search] + ' Sydney', :types => ['pizza'])
    
    
  end

  def show
    
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @spot = @client.spot(params[:id])
    @restaurant_name = @spot.name
    @restaurant_image = @spot.photos[0].fetch_url(400)
    
    @restaurant = Restaurant.find_by(google_id: params[:id])
    if @restaurant.nil?
      Restaurant.create(:name => @spot.name, :google_id => params[:id])
    end
    #@restaurant_name = @places.map(&:name)
    #@restaurant_name = @places[1].name
      
  end
end
