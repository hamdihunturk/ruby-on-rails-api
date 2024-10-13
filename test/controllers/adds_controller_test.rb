require "test_helper"

class AddsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @add = adds(:one)
  end

  test "should get index" do
    get adds_url, as: :json
    assert_response :success
  end

  test "should create add" do
    assert_difference("Add.count") do
      post adds_url, params: { add: {} }, as: :json
    end

    assert_response :created
  end

  test "should show add" do
    get add_url(@add), as: :json
    assert_response :success
  end

  test "should update add" do
    patch add_url(@add), params: { add: {} }, as: :json
    assert_response :success
  end

  test "should destroy add" do
    assert_difference("Add.count", -1) do
      delete add_url(@add), as: :json
    end

    assert_response :no_content
  end
end
