class GameSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
end

class GameDetailSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug, :formats
  has_many :formats, serializer: FormatSerializer
end
