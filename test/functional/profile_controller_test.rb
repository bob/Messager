require 'test_helper'

class ProfileControllerTest < ActionController::TestCase
  test "should get profile" do
    get :profile
    assert_response :success
  end

  test "should get change_fullname" do
    get :change_fullname
    assert_response :success
  end

end
