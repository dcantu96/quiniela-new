class Api::V1::SportResource < JSONAPI::Resource
  attributes :name
  has_many :teams
  has_many :tournaments
end