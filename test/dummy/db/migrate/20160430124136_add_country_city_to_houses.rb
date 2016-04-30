class AddCountryCityToHouses < ActiveRecord::Migration
  def change
    add_reference :houses, :country_city, index: true, foreign_key: true
  end
end
