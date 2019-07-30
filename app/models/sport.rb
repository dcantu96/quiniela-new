class Sport < ApplicationRecord
    has_many :tournaments, dependent: :destroy
    has_many :teams, dependent: :destroy
    validates :name, uniqueness: true
end
