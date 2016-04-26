class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :street
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
