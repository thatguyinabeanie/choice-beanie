require_relative 'format_serializer'
require_relative 'serializer_mixins'

module Serializer
  class Game < ActiveModel::Serializer
    include IdMixin
    include NameMixin
  end

  class GameDetails < ActiveModel::Serializer
    include NameMixin
    include IdMixin
    attributes :formats
    has_many :formats, serializer: Format
  end
end
