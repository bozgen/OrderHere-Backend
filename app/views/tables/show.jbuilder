json.table do
    json.id @table.id
    json.table_no @table.table_no
    json.status @table.status

    json.shop @table.shop.name
    json.shop_id @table.shop_id
    json.order_items do
        json.array! @order_items do |order_item|
            json.id order_item.id
            json.name order_item.name
            json.price order_item.price
            json.quantity order_item.quantity
            json.status order_item.status
        end
    end
    json.requests do
        json.array! @requests do |request|
            json.id request.id
            json.table_no @table.table_no
            json.purpose request.purpose
        end
    end
    json.created_at @table.created_at
    json.updated_at @table.updated_at
end