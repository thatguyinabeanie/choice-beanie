# app/models/match.rb
module Tournament
  class Match < ApplicationRecord
    self.table_name = 'matches'
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :round, class_name: 'Tournament::Round', inverse_of: :matches
    delegate :phase, to: :round

    has_many :match_games, class_name: 'Tournament::MatchGame', dependent: :destroy, inverse_of: :match
  end
end
