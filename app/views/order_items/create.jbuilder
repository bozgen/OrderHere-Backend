json.array! @orders do |order_item|
    json.name order_item.name
    json.price order_item.price
    json.quantity order_item.quantity
    json.status order_item.status

    json.shop order_item.shop.name
    json.table order_item.table.table_no
    json.owner_id order_item.owner_id

    json.created_at order_item.created_at
end