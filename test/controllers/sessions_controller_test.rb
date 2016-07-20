require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  include SessionsHelper

  test "should get login page" do
    get :new
    assert_response :success
  end

  test "successful login" do
    params = {
        username: "admin",
        password: "admin"
    }
    post :create, params: params
    assert_redirected_to root_url

    assert(has_role?('admin'), 'Expected role not found.')
  end

  test "failed login" do
    params = {
        username: "admin",
        password: "password_wrong"
    }
    post :create, params: params
    assert_response :success
  end

  test "logout" do
    post :destroy
    assert_redirected_to root_url
  end
end
