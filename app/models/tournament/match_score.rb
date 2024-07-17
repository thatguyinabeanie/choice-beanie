module Tournament
  class MatchScore < ApplicationRecord
    belongs_to :match
    belongs_to :winner, class_name: 'User', optional: true

    delegate :player1, to: :match
    delegate :player2, to: :match

    # Validation and logic for scores
  end
end
