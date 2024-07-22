module Match
  module Players
    extend ActiveSupport::Concern

    included do
      validates :winner, presence: true, if: -> { reported_at.present? && loser.present? }
      validates :loser, presence: true, if: -> { reported_at.present? && winner.present? }
      validate :validate_winner_must_be_match_player
      validate :validate_loser_must_be_match_player
      validate :different_winner_and_loser
      validates :reported_at, presence: true, if: -> { winner.present? || loser.present? }
    end

    def opponent_for(player)
      player == player_one ? player_two : player_one
    end

    def validate_winner_must_be_match_player
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_must_be_match_player')) if [player_one, player_two].exclude?(winner)
    end

    def validate_loser_must_be_match_player
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.loser_must_be_match_player')) if [player_one, player_two].exclude?(loser)
    end

    def different_winner_and_loser
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_and_loser_are_the_same')) if winner == loser
    end

    def report_winner!(winner:, reporter:)
      report!(winner:, loser: opponnent_for(winner), reporter:)
    end

    def report_loser!(loser:, reporter:)
      report!(loser:, winner: opponnent_for(loser), reporter:)
    end

    def report!(winner:, loser:, reporter:)
      update!(winner:, loser:, reporter:, reported_at: Time.current.utc)
    end
  end
end
