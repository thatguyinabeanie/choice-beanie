class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
end
