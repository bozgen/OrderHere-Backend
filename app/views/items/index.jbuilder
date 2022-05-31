json.array! @items do |item|
    json.id item.id
    json.name item.name.titleize
    json.description item.description
    json.price item.price
    json.quantity item.quantity

    json.shop_id item.shop_id
    json.shop item.shop.name.titleize
    json.item_type_id item.item_type.id
    json.item_type item.item_type.name

    json.created_at item.created_at
    json.updated_at item.updated_at
end