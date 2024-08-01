require_relative 'format_serializer'
require_relative 'mixin_serializer'

module Serializer
  module GameMixin
    extend ActiveSupport::Concern
    included do
      include ::Serializer::Mixin::Id
      include ::Serializer::Mixin::Name
    end
  end

  class Game < ActiveModel::Serializer
    include GameMixin
  end

  class GameDetails < ActiveModel::Serializer
    include GameMixin
    attributes :formats
    has_many :formats, serializer: Format
  end
end
