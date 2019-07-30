class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Whitelist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
  has_many :created_groups, foreign_key: "owner_id", class_name: "Group", dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :groups, through: :memberships
  has_many :picks, through: :memberships
  validates :username, uniqueness: true
  validates :username, presence: true
  validates :name, presence: true
  validates :last_name, presence: true
end
