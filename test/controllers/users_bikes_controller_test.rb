require "test_helper"

class UsersBikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @users_bike = users_bikes(:one)
  end

  test "should get index" do
    get users_bikes_url, as: :json
    assert_response :success
  end

  test "should create users_bike" do
    assert_difference("UsersBike.count") do
      post users_bikes_url, params: { users_bike: { bike: @users_bike.bike, user: @users_bike.user } }, as: :json
    end

    assert_response :created
  end

  test "should show users_bike" do
    get users_bike_url(@users_bike), as: :json
    assert_response :success
  end

  test "should update users_bike" do
    patch users_bike_url(@users_bike), params: { users_bike: { bike: @users_bike.bike, user: @users_bike.user } }, as: :json
    assert_response :success
  end

  test "should destroy users_bike" do
    assert_difference("UsersBike.count", -1) do
      delete users_bike_url(@users_bike), as: :json
    end

    assert_response :no_content
  end
end
