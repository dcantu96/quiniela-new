class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.references :owner
      t.references :tournament, foreign_key: true

      t.timestamps
    end
    add_index :groups, :name, unique: true
    add_foreign_key :groups, :users, column: :owner_id
  end
end
