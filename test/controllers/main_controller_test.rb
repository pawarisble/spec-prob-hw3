require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get test" do
    get main_test_url
    assert_response :success
  end

  test "should get test2" do
    get main_test2_url
    assert_response :success
  end

  test "should get test3" do
    get main_test3_url
    assert_response :success
  end
end
