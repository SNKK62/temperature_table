require "test_helper"

class TemperaturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get temperatures_new_url
    assert_response :success
  end

  test "should get create" do
    get temperatures_create_url
    assert_response :success
  end
end
