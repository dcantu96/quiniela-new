class Tournament < ApplicationRecord
    belongs_to :sport
    has_many :groups, dependent: :destroy
    has_many :matches, dependent: :destroy
    validates :name, uniqueness: true
end
