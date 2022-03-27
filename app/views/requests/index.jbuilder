json.array! @requests do |request|
    json.id request.id
    json.purpose request.purpose

    json.shop request.shop.name
    json.table request.table.table_no
    json.owner_id request.owner_id

    json.created_at request.created_at
    json.updated_at request.updated_at
end