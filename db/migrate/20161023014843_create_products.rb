class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name, null: false
      t.references :user, null: false

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
