if current_user.admin?
  json.extract! @product, :id, :name, :user_id, :created_at, :updated_at
else
  json.extract! @product, :id, :name, :created_at, :updated_at
end