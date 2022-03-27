json.array! @order_items do |order_item|
    json.id order_item.id
    json.name order_item.name
    json.price order_item.price
    json.quantity order_item.quantity

    json.shop order_item.shop.name
    json.table order_item.table.table_no
    json.owner_id order_item.owner_id

    json.created_at order_item.created_at
    json.updated_at order_item.updated_at
end