class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, null: false
      t.references :user, null: false

      t.timestamps
    end
    add_index :products, :user_id
  end

  def self.down
    drop_table :products
  end
end
