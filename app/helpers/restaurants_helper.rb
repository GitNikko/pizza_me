module RestaurantsHelper
  
  def test
    @client = GooglePlaces::Client.new(ENV['GOOGLE_PLACES_KEY'])
    @places = @client.spots(-33.8670522, 151.1957362, :name => 'italian')
  end
  
end
