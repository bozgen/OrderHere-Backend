json.user do
    json.id @user.id
    json.username @user.username
    json.email @user.email

    json.role @user.role

    json.created_at @user.created_at
end