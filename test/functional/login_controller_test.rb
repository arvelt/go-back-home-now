require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get oauth" do
    get :oauth
    assert_response :success
  end

  test "should get oauth_callback" do
    get :oauth_callback
    assert_response :success
  end

end
