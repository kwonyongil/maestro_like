require 'test_helper'

class MusicsControllerTest < ActionController::TestCase
  test "should get music" do
    get :music
    assert_response :success
  end

end
