class PlayerSerializer < ActiveModel::Serializer
  attributes :user_id, :username, :team_sheet_submitted, :checked_in
  def team_sheet_submitted
    object.pokemon_sets.present? || object.pokemon_sets.any?
  end
end

class PlayerDetailsSerializer < PlayerSerializer
  has_many :pokemon_sets, serializer: PokemonSetSerializer
end
