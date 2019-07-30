class Team < ApplicationRecord
    belongs_to :sport
    has_many :home_team_matches, class_name: 'Match', foreign_key: 'home_team_id', dependent: :destroy
    has_many :visit_team_matches, class_name: 'Match', foreign_key: 'visit_team_id', dependent: :destroy
    has_many :winning_team_matches, class_name: 'Match', foreign_key: 'winning_team_id', dependent: :destroy
    validates :name, uniqueness: true
    validates :abbreviation, uniqueness: true
end
