require "test_helper"

class ShopTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop_type = shop_types(:one)
  end

  test "should get index" do
    get shop_types_url, as: :json
    assert_response :success
  end

  test "should create shop_type" do
    assert_difference("ShopType.count") do
      post shop_types_url, params: { shop_type: { name: @shop_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show shop_type" do
    get shop_type_url(@shop_type), as: :json
    assert_response :success
  end

  test "should update shop_type" do
    patch shop_type_url(@shop_type), params: { shop_type: { name: @shop_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy shop_type" do
    assert_difference("ShopType.count", -1) do
      delete shop_type_url(@shop_type), as: :json
    end

    assert_response :no_content
  end
end
