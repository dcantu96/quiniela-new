class Api::V1::MembershipResource < JSONAPI::Resource
  has_one :user
  has_one :group
  has_many :picks
end