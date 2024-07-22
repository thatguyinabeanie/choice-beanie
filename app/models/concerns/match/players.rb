module Match
  module Players
    extend ActiveSupport::Concern

    included do
      validates :reported_at, presence: true, if: -> { winner.present? || loser.present? }
      validates :winner, presence: true, if: -> { reported_at.present? || loser.present? }
      validates :loser, presence: true, if: -> { reported_at.present? || winner.present? }

      validate :winner_is_match_player
      validate :loser_is_match_player
      validate :winner_is_not_loser
    end

    def opponent_for(player)
      player == player_one ? player_two : player_one
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

    private

    def winner_is_match_player
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_must_be_match_player')) if [player_one, player_two].exclude?(winner)
    end

    def loser_is_match_player
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.loser_must_be_match_player')) if [player_one, player_two].exclude?(loser)
    end

    def winner_is_not_loser
      return if winner.nil? && loser.nil?

      errors.add(:base, I18n.t('errors.match_game.winner_and_loser_are_the_same')) if winner == loser
    end
  end
end
