require_relative 'mixin_serializer'
module Serializer
  class PokemonSet < ActiveModel::Serializer
    include Serializer::Mixin::Id
    attributes :nickname
    attributes :ability, :tera_type, :nature, :held_item
    attributes :move1, :move2, :move3, :move4
  end
end
