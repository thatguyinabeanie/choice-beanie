module Serializer
  class Game
    include JSONAPI::Serializer
    attributes :id, :name, :slug
  end
end
