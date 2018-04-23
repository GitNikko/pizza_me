require 'test_helper'

class ReviewsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:nicholas)
    @saved_restaurant = restaurants(:test_restaurant)
  end
  
  test "invalid review submission" do
    log_in_as(@user)
    get restaurants_show_path, params: { id: @saved_restaurant.yelp_id }
    assert_template 'reviews/_review_form'
    assert_no_difference 'Review.count' do
      post reviews_path, params: { restaurant_id: @saved_restaurant.id, review: { content: "  ", rating: nil } }
    end
    assert_not flash.empty?
  end
  
  test "valid review submission" do
    log_in_as(@user)
    get restaurants_show_path, params: { id: @saved_restaurant.yelp_id }
    assert_template 'reviews/_review_form'
    assert_difference('Review.count', 1) do
      post reviews_path, params: { restaurant_id: @saved_restaurant.id, review: { content: "Great food", rating: 5 } }
    end
    assert_not flash.empty?
  end
  
end
