module Tournament
  class Registration < ApplicationRecord
    MAX_POKEMON_SUBMISSIONS = 6

    belongs_to :player, class_name: 'User'
    belongs_to :tournament, class_name: 'Tournament::Tournament', inverse_of: :registrations

    validates :player_id, presence: true
    validates :tournament_id, presence: true
    validates :player_id, uniqueness: { scope: :tournament_id, message: I18n.t('tournament.registration.already_registered') }

    has_many :pokemon_sets, dependent: :destroy
    accepts_nested_attributes_for :pokemon_sets

    validate :pokemon_sets_count_within_limit

    private

    def pokemon_sets_count_within_limit
      return unless pokemon_sets.size > MAX_POKEMON_SUBMISSIONS

      errors.add(:pokemon_sets, I18n.t('tournament.registration.too_many_pokemon'))
    end
  end
end
