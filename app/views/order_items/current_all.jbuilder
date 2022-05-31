json.array! @order_items do |order_item|
    json.id order_item.id
    json.name order_item.name
    json.price order_item.price
    json.quantity order_item.quantity
    json.status order_item.status

    json.shop order_item.shop.name
    json.shop_id order_item.shop_id
    json.table Table.find(order_item.table_id).table_no
    json.table_id order_item.table_id

    json.created_at order_item.created_at
    json.updated_at order_item.updated_at
end