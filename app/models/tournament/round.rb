module Tournament
  class Round < ApplicationRecord
    belongs_to :phase
    has_many :matches, dependent: :destroy
  end
end
