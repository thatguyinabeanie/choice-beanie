class Tournament < ApplicationRecord
  validates :name, presence: true
  has_many :phases, dependent: :destroy
end
