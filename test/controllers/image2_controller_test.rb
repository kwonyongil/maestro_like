require 'test_helper'

class Image2ControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

end
