json.array! @items do |item|
    json.id item.id
    json.name item.name
    json.description item.description
    json.price item.price

    json.shop item.shop.name
    json.item_type item.item_type.name

    json.created_at item.created_at
    json.updated_at item.updated_at
end