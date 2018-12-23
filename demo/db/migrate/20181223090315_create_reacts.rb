class CreateReacts < ActiveRecord::Migration[5.2]
  def change
    create_table :reacts do |t|
      t.references :reactable, polymorphic: true
      t.references :user, foreign_key: true
      t.integer :reaction

      t.timestamps
    end
  end
end
