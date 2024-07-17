# app/models/match.rb
module Tournament
  class Match < ApplicationRecord
    belongs_to :tournament
    belongs_to :player1
    belongs_to :player2
    belongs_to :winner

    has_many :match_scores, dependent: :destroy
  end
end
