class Pick < ApplicationRecord
  belongs_to :membership, required: true
  belongs_to :match, required: true
  belongs_to :picked_team, class_name: 'Team', foreign_key: 'picked_team_id', required: true
  has_one :user, through: :membership
  validates :match, uniqueness: { scope: :membership }
  validate :picked_team_belongs_to_match

  def picked_team_belongs_to_match
    if [match.home_team, match.visit_team].exclude? picked_team
      errors.add :picked_team, 'must be part of the match.'
    end
  end

  def correct?
    return nil unless match.decided?
    picked_team == match.winning_team
  end

  def show_pick?
    return false if match.started?
  end

  def url
    "http://localhost:3000/api/v1/picks/#{id}"
  end
end
