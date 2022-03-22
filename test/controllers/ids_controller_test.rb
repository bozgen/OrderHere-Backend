require "test_helper"

class IdsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @id = ids(:one)
  end

  test "should get index" do
    get ids_url, as: :json
    assert_response :success
  end

  test "should create id" do
    assert_difference("Id.count") do
      post ids_url, params: { id: { description: @id.description, item_type_id: @id.item_type_id, name: @id.name, price: @id.price, shop_id: @id.shop_id } }, as: :json
    end

    assert_response :created
  end

  test "should show id" do
    get id_url(@id), as: :json
    assert_response :success
  end

  test "should update id" do
    patch id_url(@id), params: { id: { description: @id.description, item_type_id: @id.item_type_id, name: @id.name, price: @id.price, shop_id: @id.shop_id } }, as: :json
    assert_response :success
  end

  test "should destroy id" do
    assert_difference("Id.count", -1) do
      delete id_url(@id), as: :json
    end

    assert_response :no_content
  end
end
