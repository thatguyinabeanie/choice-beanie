module Tournament
  class Player < ApplicationRecord
    MAX_POKEMON_SUBMISSIONS = 6
    self.table_name = 'players'
    belongs_to :user, class_name: 'User'
    belongs_to :tournament, class_name: 'Tournament::Tournament', inverse_of: :players
    belongs_to :pokemon_team, class_name: 'PokemonTeam', optional: true

    validates :user_id, presence: true
    validates :tournament_id, presence: true
    validates :user_id, uniqueness: { scope: :tournament_id, message: I18n.t('tournament.registration.already_registered') }

    accepts_nested_attributes_for :pokemon_team

    delegate :username, to: :user

    def self.checked_in_and_ready
        where.not(pokemon_team_id: nil)
        .where.not(checked_in_at: nil)
        .where.not(in_game_name: nil)
    end

    def ready?
      return true unless !checked_in? || pokemon_team.blank?
      false
    end

    def check_in!
      raise 'Player is already checked in.' if checked_in?
      raise 'Check in is not open for this tournament.' unless tournament.check_in_start_at <= Time.current.utc
      raise 'Check in is closed for this tournament.' unless tournament.started_at.blank? || tournament.late_registration == true

      update!(checked_in_at: Time.current.utc)
    end

    def checked_in?
      checked_in_at.present?
    end
  end
end
