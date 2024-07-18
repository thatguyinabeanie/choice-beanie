module Tournament
  class PokemonSet < ApplicationRecord
    belongs_to :registration, class_name: 'Tournament::Registration'

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
