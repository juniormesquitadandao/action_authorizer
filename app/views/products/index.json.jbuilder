if current_user.admin?
  json.array!(@products) do |product|
    json.extract! product, :id, :name, :user_id
    json.url product_url(product, format: :json)
  end
else
  json.array!(@products) do |product|
    json.extract! product, :id, :name
    json.url product_url(product, format: :json)
  end
end