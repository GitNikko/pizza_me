require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_path
    assert_response :success
  end
 
  test "should get login" do
    get login_path
    assert_response :success
  end
  
end
