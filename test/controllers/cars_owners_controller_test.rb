require "test_helper"

class CarsOwnersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cars_owner = cars_owners(:one)
  end

  test "should get index" do
    get cars_owners_url, as: :json
    assert_response :success
  end

  test "should create cars_owner" do
    assert_difference("CarsOwner.count") do
      post cars_owners_url, params: { cars_owner: { carId: @cars_owner.carId, profileId: @cars_owner.profileId } }, as: :json
    end

    assert_response :created
  end

  test "should show cars_owner" do
    get cars_owner_url(@cars_owner), as: :json
    assert_response :success
  end

  test "should update cars_owner" do
    patch cars_owner_url(@cars_owner), params: { cars_owner: { carId: @cars_owner.carId, profileId: @cars_owner.profileId } }, as: :json
    assert_response :success
  end

  test "should destroy cars_owner" do
    assert_difference("CarsOwner.count", -1) do
      delete cars_owner_url(@cars_owner), as: :json
    end

    assert_response :no_content
  end
end
