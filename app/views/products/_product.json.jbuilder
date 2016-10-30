if current_user.admin?
  json.extract! product, :id, :name, :user_id
  json.url product_url(product, format: :json)
else
  json.extract! product, :id, :name
  json.url product_url(product, format: :json)
end