# app/models/match.rb
module Tournament
  class Match < ApplicationRecord
    self.table_name = 'matches'
    belongs_to :player1, class_name: 'User'
    belongs_to :player2, class_name: 'User'
    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :round, class_name: 'Tournament::Round'

    delegate :phase, to: :round
  end
end
