class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :home_team, class_name: 'Team', foreign_key: 'home_team_id'
  belongs_to :visit_team, class_name: 'Team', foreign_key: 'visit_team_id'
  belongs_to :winning_team, class_name: 'Team', foreign_key: 'winning_team_id', required: false
  has_many :picks, dependent: :destroy
  validates :date, presence: true
  validates :tournament, presence: true
  validates :home_team, presence: true
  validates :visit_team, presence: true
  validates :home_team, uniqueness: { scope: :visit_team }
  validate :match_teams

  def match_teams
    if home_team.sport != visit_team.sport
      errors.add(:base, :home_team_and_visit_team_sport_do_not_match, message: "Home team and visit team sports do not match.")
    end
  end


  def started?
    date < DateTime.now
  end

  def decided?
    return nil unless started?
    winning_team.present?
  end

  def winner
    winning_team if decided?
  end

  def date
    super.localtime
  end
end
