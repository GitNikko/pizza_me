module RestaurantsHelper
  include YelpSetup
  
  # YELP ATTRIBUTES  
  def restaurant_name() @spot["name"] end
  def restaurant_image() @spot["image_url"] end
  def restaurant_location() @spot["location"]["city"] end
  def restaurant_address() @spot["location"]["display_address"].join(', ') end
  def restaurant_phone() @spot["display_phone"] end
  def restaurant_price() @spot["price"] end    
  def restaurant_rating() @spot["rating"] end
  def open_now() @spot["hours"][0]["is_open_now"] unless @spot["hours"].nil? end
  def restaurant_photo(array_index)
    @spot['photos'][array_index]
  end

end
