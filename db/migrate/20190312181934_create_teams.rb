class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbreviation
      t.references :sport, foreign_key: true

      t.timestamps
    end
    add_index :teams, :name, unique: true
    add_index :teams, :abbreviation, unique: true
  end
end
