class CreateCountryCities < ActiveRecord::Migration
  def change
    create_table :country_cities do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
