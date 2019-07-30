class Api::V1::TournamentResource < JSONAPI::Resource
  attributes :name
  has_one :sport
  has_many :groups
  has_many :matches
end