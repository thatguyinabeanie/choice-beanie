# app/models/pokemon_team.rb
class PokemonTeam < ApplicationRecord
  belongs_to :user
  has_many :pokemon_sets, class_name: 'PokemonSet', inverse_of: :pokemon_team, dependent: :destroy

  validates :user_id, presence: true
  validate :no_more_than_six_pokemon_sets

  private

  def no_more_than_six_pokemon_sets
    return if pokemon_sets.size <= 6

    errors.add(:pokemon_sets, 'Too many Pokemon.')
  end
end
