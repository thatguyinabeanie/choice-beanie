require_relative 'serializer_mixins'
module Serializer
  class PokemonSet < ActiveModel::Serializer
    include IdMixin
    attributes :nickname
    attributes :ability, :tera_type, :nature, :held_item
    attributes :move1, :move2, :move3, :move4
  end
end
