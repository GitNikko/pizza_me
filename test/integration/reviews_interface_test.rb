require 'test_helper'

class ReviewsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:nicholas)
    @restaurant = restaurants(:test_restaurant)
  end
  
  test "reviews interface" do
    log_in_as(@user)
    # Invalid submission
    assert_no_difference 'Review.count' do
      post reviews_path, params: { review: { content: "" } }
    end
    # TO BE COMPLETED!
  end
  
end
