json.shop do
    json.id @shop.id
    json.name @shop.name
    json.picture_url @shop.picture_url
    json.shop_type ShopType.find(@shop.shop_type_id).name

    json.created_at @shop.created_at
end