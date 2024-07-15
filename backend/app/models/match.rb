class Match < ApplicationRecord
  belongs_to :tournament
  belongs_to :player1
  belongs_to :player2
  belongs_to :winner
end
