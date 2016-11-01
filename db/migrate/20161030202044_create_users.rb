class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
