module Tournament
  class Player < ApplicationRecord
    MAX_POKEMON_SUBMISSIONS = 6
    self.table_name = 'players'
    belongs_to :user, class_name: 'User'
    belongs_to :tournament, class_name: 'Tournament::Tournament', inverse_of: :players

    validates :user_id, presence: true
    validates :tournament_id, presence: true
    validates :user_id, uniqueness: { scope: :tournament_id, message: I18n.t('tournament.registration.already_registered') }

    has_many :pokemon_sets, dependent: :destroy, class_name: 'Tournament::PokemonSet', inverse_of: :player
    accepts_nested_attributes_for :pokemon_sets

    validate :pokemon_sets_count_within_limit

    def add_pokemon_sets!(pokemon_sets = [])
      pokemon_sets.each { |pokemon_set| add_pokemon_set!(pokemon_set, skip_save: true) }
      save!
    end

    def add_pokemon_set!(pokemon_set, skip_save: false)
      raise 'Cannot add an empty Pokemon set.' if pokemon_set.blank? || pokemon_set.invalid? || pokemon_set.nil?

      pokemon_sets << pokemon_set

      save! unless skip_save
    end

    def add_pokemon_sets(pokemon_sets = [])
      pokemon_sets.each { |pokemon_set| add_pokemon_set(pokemon_set) }
    end

    def add_pokemon_set(pokemon_set)
      pokemon_sets << pokemon_set
    end

    private

    def pokemon_sets_count_within_limit
      return unless pokemon_sets.size > MAX_POKEMON_SUBMISSIONS

      errors.add(:pokemon_sets, I18n.t('tournament.registration.too_many_pokemon'))
    end
  end
end