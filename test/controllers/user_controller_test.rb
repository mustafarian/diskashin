require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  test "should get new with new user" do
    get :new
    user = assigns(:user)
    assert user.new_record?
    assert_response :success
  end

  test "should create user" do
    params = {
        user: {
            email_address: "user@example.com",
            password: "password",
            password_confirmation: "password",
            username: "user",
            name: "User bin User"
        }
    }
    post :create, params: params
    assert_redirected_to root_url
  end

  test "should rerender 'new' when parameter is missing" do
    params = {
        user: {
            email_address: "user@example.com"
        }
    }
    post :create, params: params
    assert_response :success
  end
end
