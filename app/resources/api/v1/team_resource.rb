class Api::V1::TeamResource < JSONAPI::Resource
  attributes :name, :abbreviation
  has_one :sport
end