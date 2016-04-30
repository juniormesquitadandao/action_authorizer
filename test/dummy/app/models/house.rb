class House < ActiveRecord::Base
  belongs_to :user
  belongs_to :city, class_name: 'Country::City', foreign_key: :country_city_id
end