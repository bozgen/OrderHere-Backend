require "test_helper"

class ItemTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_type = item_types(:one)
  end

  test "should get index" do
    get item_types_url, as: :json
    assert_response :success
  end

  test "should create item_type" do
    assert_difference("ItemType.count") do
      post item_types_url, params: { item_type: { name: @item_type.name } }, as: :json
    end

    assert_response :created
  end

  test "should show item_type" do
    get item_type_url(@item_type), as: :json
    assert_response :success
  end

  test "should update item_type" do
    patch item_type_url(@item_type), params: { item_type: { name: @item_type.name } }, as: :json
    assert_response :success
  end

  test "should destroy item_type" do
    assert_difference("ItemType.count", -1) do
      delete item_type_url(@item_type), as: :json
    end

    assert_response :no_content
  end
end
