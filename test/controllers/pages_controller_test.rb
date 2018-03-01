require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end

  test "should get news" do
    get news_path
    assert_response :success
  end

  test "should get pizza" do
    get pizza_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

end
