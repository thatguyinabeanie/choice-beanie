module Tournament
  class Round < ApplicationRecord
    self.table_name = 'rounds'
    belongs_to :phase, class_name: 'Phase::Base', inverse_of: :rounds
    has_many :matches, class_name: 'Tournament::Match', dependent: :destroy, inverse_of: :round
    validates :phase, presence: true
    validates :round_number, presence: true
  end
end
