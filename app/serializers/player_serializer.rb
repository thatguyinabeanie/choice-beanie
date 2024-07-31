require_relative 'user_serializer'

class PlayerSerializer < ActiveModel::Serializer
  belongs_to :user, serializer: UserSerializer

  attributes :in_game_name, :checked_in_at, :checked_in
  attributes :team_sheet_submitted, :team_sheet_submitted_at

  def checked_in
    object.checked_in_at.present?
  end

  def team_sheet_submitted
    object.pokemon_sets.present? || object.pokemon_sets.any?
  end

  def team_sheet_submitted_at
    object.pokemon_sets.maximum(:updated_at) || object.pokemon_sets.maximum(:created_at)
  end
end

class PlayerDetailsSerializer < PlayerSerializer
  has_many :pokemon_sets, serializer: PokemonSetSerializer
end
