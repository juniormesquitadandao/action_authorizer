json.array!(@country_cities) do |country_city|
  json.extract! country_city, :id, :name
  json.url country_city_url(country_city, format: :json)
end
