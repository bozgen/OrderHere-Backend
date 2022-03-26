json.table do
    json.id @table.id
    json.table_no @table.table_no
    json.status @table.status
    json.owner_id @table.owner_id

    json.shop @table.shop.name

    json.created_at @table.created_at
end