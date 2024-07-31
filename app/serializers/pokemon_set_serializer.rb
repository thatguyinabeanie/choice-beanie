class PokemonSetSerializer < ActiveModel::Serializer
  attributes :name, :ability, :tera_type, :nature, :held_item, :move1, :move2, :move3, :move4
end
