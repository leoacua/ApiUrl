require "test_helper"

class Api::EarthquakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_earthquakes_index_url
    assert_response :success
  end

  test "should get show" do
    get api_earthquakes_show_url
    assert_response :success
  end

  test "should get create" do
    get api_earthquakes_create_url
    assert_response :success
  end

  test "should get update" do
    get api_earthquakes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_earthquakes_destroy_url
    assert_response :success
  end
end
