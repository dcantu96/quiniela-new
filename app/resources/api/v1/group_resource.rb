class Api::V1::GroupResource < JSONAPI::Resource
    attributes :name
    has_one :tournament
    has_one :owner, class_name: 'User'
    has_many :users
  end