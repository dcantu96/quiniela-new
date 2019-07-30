class Api::V1::UserResource < JSONAPI::Resource
  attributes :email, :name, :last_name, :username
  has_many :created_groups, class_name: 'Group'
  has_many :memberships
  has_many :groups
  has_many :picks
end