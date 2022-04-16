require "test_helper"

class Public::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get public_home_about_url
    assert_response :success
  end
end
