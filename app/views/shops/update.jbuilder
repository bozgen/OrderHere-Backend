json.shop do
    json.id @shop.id
    json.name @shop.name
    json.picture_url @shop.picture_url
    json.shop_type @shop.shop_type.name

    json.created_at @shop.created_at
    json.updated_at @shop.updated_at
end