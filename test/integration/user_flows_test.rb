require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test 'user can see home page after login' do
    get user_session_path
    sign_in users(:user1)
    post user_session_url
    follow_redirect!
    assert_equal 200, status
    assert_equal '/', path
  end

  test 'user can not see home page without login' do
    get '/'
    assert_equal 302, status
    follow_redirect!
    assert_equal '/users/sign_in', path
    assert_equal 200, status
  end
end
