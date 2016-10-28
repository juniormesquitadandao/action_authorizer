class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_index :products, :user_id
  end
end
