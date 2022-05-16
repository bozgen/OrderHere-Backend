json.(user, :id, :username, :email, :is_owner)
json.token user.generate_jwt