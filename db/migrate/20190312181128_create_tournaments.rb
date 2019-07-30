class CreateTournaments < ActiveRecord::Migration[5.2]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :sport, foreign_key: true

      t.timestamps
    end
    add_index :tournaments, :name, unique: true
  end
end
