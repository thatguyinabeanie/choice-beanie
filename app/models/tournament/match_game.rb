module Tournament
  class MatchGame < ApplicationRecord
    include Helpers::Match::OpponentFor
    self.table_name = 'match_games'
    belongs_to :match, class_name: 'Tournament::Match', inverse_of: :match_games

    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :loser, class_name: 'User', optional: true
    belongs_to :reporter, class_name: 'User', optional: true

    delegate :player1, to: :match
    delegate :player2, to: :match

    validates :game_number, presence: true
    validate :different_winner_and_loser
    validate :validate_winner
    validate :validate_loser
    validate :reporter_role_validation

    def report_game_winner!(winner:, reporter:)
      report_game!(winner:, loser: opponnent_for(winner), reporter:)
    end

    def report_game_loser!(loser:, reporter:)
      report_game!(loser:, winner: opponnent_for(loser), reporter:)
    end

    def report_game!(winner:, loser:, reporter:)
      update!(winner:, loser:, reporter:, reported_at: Time.current.utc)
    end

    private

    def reporter_role_validation
      return if reporter.nil?
      return if reporter == player1 || reporter == player2
      return if reporter.staff_member_of?(match.phase.tournament.organization)

      errors.add(:base, I18n.t('errors.match_game.reporter_must_be_match_player_or_staff'))
    end

    def validate_winner
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_must_be_match_player')) if [player1, player2].exclude?(winner)
    end

    def validate_loser
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.loser_must_be_match_player')) if [player1, player2].exclude?(loser)
    end

    def different_winner_and_loser
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_and_loser_are_the_same')) if winner == loser
    end
  end
end
