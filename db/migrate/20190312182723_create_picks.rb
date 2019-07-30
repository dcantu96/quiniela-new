class CreatePicks < ActiveRecord::Migration[5.2]
  def change
    create_table :picks do |t|
      t.references :membership, foreign_key: true, null: false
      t.references :match, foreign_key: true, null: false
      t.references :picked_team, null: false

      t.timestamps
    end
    add_foreign_key :picks, :teams, column: :picked_team_id
    add_index :picks, [:membership_id, :match_id], unique: true
  end
end
