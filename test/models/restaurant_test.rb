require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  def setup
    @restaurant = restaurants(:test_restaurant)
  end
  
  test "should be valid" do
    assert @restaurant.valid?
  end
  
  test "yelp_id should be present" do
    @restaurant.yelp_id = nil
    assert_not @restaurant.valid?
  end
  
  test "restaurant name should be present" do
    @restaurant.name = "  "
    assert_not @restaurant.valid?
  end
end
