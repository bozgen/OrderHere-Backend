json.item do
    json.id @item.id
    json.name @item.name
    json.description @item.description
    json.price @item.price

    json.shop @item.shop.name
    json.item_type @item.item_type.name

    json.created_at @item.created_at
end