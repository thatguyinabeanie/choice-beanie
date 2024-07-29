module Serializer
  class Game < ActiveModel::Serializer
    attributes :id, :name, :slug
  end
end
