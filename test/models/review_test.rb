require 'test_helper'

class ReviewTest < ActiveSupport::TestCase

  def setup
    @user = users(:nicholas)
    @restaurant = restaurants(:test_restaurant)
    @review = @restaurant.reviews.build(content: "Great food here", user_id: @user.id, rating: 5)
  end

  test "should be valid" do
    assert @review.valid?
  end
  
  test "user id should be present" do
    @review.user_id = nil
    assert_not @review.valid?
  end
  
  test "restaurant_id should be present" do
    @review.restaurant_id = nil
    assert_not @review.valid?
  end
  
  test "content should be present" do
    @review.content = "   "
    assert_not @review.valid?
  end
  
  test "content should be at most 140 characters" do
    @review.content = "a" * 141
    assert_not @review.valid?
  end
  
  test "rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end
  
  test "order should be most recent first" do
    assert_equal reviews(:most_recent), Review.first
  end
  
  test "associated reviews should be destroyed with user deletion" do
    @user.save
    @restaurant.reviews.create!(content: "Great food", rating: 5, user_id: @user.id)
    assert_difference 'Review.count', -1 do
      @user.destroy
    end
  end
  
  test "associated reviews should be destroyed with restaurant deletion" do
    @restaurant.reviews.create!(content: "Great food", rating: 5, user_id: @user.id)
    assert_difference 'Review.count', -1 do
      @restaurant.destroy
    end
  end

end
