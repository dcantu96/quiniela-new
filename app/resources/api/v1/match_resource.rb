class Api::V1::MatchResource < JSONAPI::Resource
  attributes :date
  has_one :tournament
  has_one :home_team, class_name: 'Team'
  has_one :visit_team, class_name: 'Team'
  has_one :winning_team, class_name: 'Team', if: Proc.new { |match| match.decided? }
end