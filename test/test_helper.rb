require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Returns true if a test user is logged in.
  def is_logged_in?
    !session[:user_id].nil?
  end

  # Log in as a particular user.
  def log_in_as(user)
    session[:user_id] = user.id
  end

  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:default] = OmniAuth::AuthHash.new({
  :provider => 'default',
  :uid => '123545',
  info: {
    :email => 'user@example.com',
    :name => 'Example User',
    :image => 'http://graph.facebook.com/1234567/picture?type=square'
  }
  })
end

class ActionDispatch::IntegrationTest

  # Log in as a particular user.
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end
