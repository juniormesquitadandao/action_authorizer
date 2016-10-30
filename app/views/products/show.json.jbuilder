if current_user.admin?
  json.extract! @product, :id, :name, :user_id
else
  json.extract! @product, :id, :name
end