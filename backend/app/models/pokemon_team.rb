# app/models/pokemon_team.rb
class PokemonTeam < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :pokemon, class_name: 'Pokemon', inverse_of: :pokemon_team, dependent: :destroy
  belongs_to :player, class_name: 'Tournament::Player', inverse_of: :pokemon_team, optional: true

  validates :user_id, presence: true
  validate :no_more_than_six_pokemon

  private

  def no_more_than_six_pokemon
    return unless pokemon.size > 6

    errors.add(:pokemon, 'Too many Pokemon.')
  end
end
