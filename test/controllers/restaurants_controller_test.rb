require 'test_helper'
require 'restaurants_helper'


class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  include RestaurantsHelper

  def setup
   @saved_restaurant = restaurants(:test_restaurant)
   @new_restaurant = Restaurant.new(yelp_id: "da-orazio-pizza-porchetta-bondi-beach", name: "Da Orazio")
  end

  test "should get restaurant path" do
    get restaurants_show_path, params: { id: @saved_restaurant.yelp_id }
    assert_response :success
  end

  test "should add new restaurant to database" do
    assert_difference('Restaurant.count', 1) do
      get restaurants_show_path, params: { id: @new_restaurant.yelp_id }
    end
  end

  test "should find already saved restaurant from database" do
    assert_no_difference('Restaurant.count') do
      get restaurants_show_path, params: { id: @saved_restaurant.yelp_id }
    end
  end

end
