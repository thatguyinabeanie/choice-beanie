module Tournament
  class PokemonSet < ApplicationRecord
    belongs_to :player, class_name: 'Tournament::Player', inverse_of: :pokemon_sets

    validates :name, presence: true
    validates :ability, presence: true
    validates :tera_type, presence: true
    validates :nature, presence: true

    validates :held_item, presence: true

    validates :move1, presence: true
    validates :move2, presence: true
    validates :move3, presence: true
    validates :move4, presence: true
  end
end
