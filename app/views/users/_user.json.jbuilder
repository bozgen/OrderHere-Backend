json.extract! user, :id, :username, :email, :encrypted_password, :encrypted_token, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
