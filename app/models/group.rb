class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: :owner_id
  belongs_to :tournament
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :picks, through: :memberships
  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true
  validates :tournament, presence: true
end
