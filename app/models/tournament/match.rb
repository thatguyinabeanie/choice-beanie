# app/models/match.rb
module Tournament
  class Match < ApplicationRecord
    include ::MatchPlayersConcern
    self.table_name = 'matches'
    belongs_to :player_one, class_name: 'User'
    belongs_to :player_two, class_name: 'User'

    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :loser, class_name: 'User', optional: true

    belongs_to :round, class_name: 'Tournament::Round', inverse_of: :matches
    delegate :phase, to: :round
    delegate :started_at, :ended_at, to: :round

    has_many :match_games, class_name: 'Tournament::MatchGame', dependent: :destroy, inverse_of: :match

    validates :player_one, presence: true
    validates :player_two, presence: true
    validates :round, presence: true, uniqueness: { scope: %i[player_one_id player_two_id] }

    def check_in(player:)
      raise ArgumentError, 'Cannot check in a player that is not part of the match.' if [player_one, player_two].exclude?(player)

      time_now = Time.current.utc
      if player == player_one
        self.player_one_check_in = time_now
      else
        self.player_two_check_in = time_now
      end

      save!
    end

    def checked_in?(player:)
      if player == player_one
        player_one_check_in.present?
      elsif player == player_two
        player_two_check_in.present?
      else
        raise ArgumentError, 'Cannot check in a player that is not part of the match.'
      end
    end
  end
end
