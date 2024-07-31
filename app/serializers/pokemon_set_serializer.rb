class PokemonSetSerializer < ActiveModel::Serializer
  attributes :name, :nickname
  attributes :ability, :tera_type, :nature, :held_item
  attributes :move1, :move2, :move3, :move4
end
