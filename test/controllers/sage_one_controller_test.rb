require 'test_helper'

class SageOneControllerTest < ActionController::TestCase
  test "should get auth" do
    get :auth
    assert_response :success
  end

  test "should get data" do
    get :data
    assert_response :success
  end

end
