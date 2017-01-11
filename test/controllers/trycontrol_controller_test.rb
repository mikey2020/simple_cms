require 'test_helper'

class TrycontrolControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get trycontrol_home_url
    assert_response :success
  end

end
