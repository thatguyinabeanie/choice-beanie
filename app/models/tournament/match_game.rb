module Tournament
  class MatchGame < ApplicationRecord
    include ::Match::Players
    self.table_name = 'match_games'
    belongs_to :match, class_name: 'Tournament::Match', inverse_of: :match_games

    belongs_to :winner, class_name: 'User', optional: true
    belongs_to :loser, class_name: 'User', optional: true
    belongs_to :reporter, class_name: 'User', optional: true

    delegate :player_one, to: :match
    delegate :player_two, to: :match

    validates :game_number, presence: true
    validate :different_winner_and_loser
    validate :validate_winner_must_be_match_player
    validate :validate_loser_must_be_match_player
    validate :reporter_role_validation
    validates :match, presence: true
    validates :reporter, presence: true, if: -> { reported_at.present? && (winner.present? || loser.present?) }
    validates :winner, presence: true, if: -> { reported_at.present? && loser.present? }
    validates :loser, presence: true, if: -> { reported_at.present? && winner.present? }
    validates :reported_at, presence: true, if: -> { winner.present? || loser.present? }

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
      return if reporter == player_one || reporter == player_two
      return if reporter.staff_member_of?(match.phase.tournament.organization)

      errors.add(:base, I18n.t('errors.match_game.reporter_must_be_match_player_or_staff'))
    end
  end
end
