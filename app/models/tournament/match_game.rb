module Tournament
  class MatchGame < ApplicationRecord
    self.table_name = 'match_games'
    belongs_to :match, class_name: 'Tournament::Match', inverse_of: :match_games

    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :loser, class_name: 'User', optional: true

    belongs_to :reporter, class_name: 'User', optional: true

    delegate :player1, to: :match
    delegate :player2, to: :match

    validates :game_number, presence: true
    validate :different_winner_and_loser
    validate :validate_winner_and_loser

    # TODO: Add validations for the following:
    # - reporter must be one of the players, or a associated tournament organization staff member, or an associated tournament admin, an associated tournament organization owner
    # - when validating report. also validate that report_submitted_at is present

    def report_game_winner!(winner:, reporter:)
      report_game(winner:, loser: other_player(winner), reporter:)
    end

    def report_game_loser!(loser:, reporter:)
      report_game(loser:, winner: other_player(loser), reporter:)
    end

    def report_game!(winner:, loser:, reporter:)
      report_submitted_at = Time.current.utc
      update!(winner:, loser:, reporter:, report_submitted_at:)
    end

    private

    def other_player(player)
      player == player1 ? player2 : player1
    end

    def different_winner_and_loser
      return if winner.nil? && loser.nil?

      errors.add(:base, 'Winner and loser cannot be the same') if winner_id == loser_id
    end

    def validate_winner_and_loser
      return if winner.nil? && loser.nil?

      player_ids = [match.player1.id, match.player2.id]
      errors.add(:base, 'Winner and loser must be either player 1 or player 2') unless player_ids.include?(winner_id) && player_ids.include?(loser_id)
    end
  end
end
