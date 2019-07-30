class Api::V1::PickResource < JSONAPI::Resource
  has_one :membership
  has_one :match
  has_one :picked_team, class_name: 'Team'
end