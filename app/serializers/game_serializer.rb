class GameSerializer < ActiveModel::Serializer
  attributes :id, :name
end

class GameDetailsSerializer < GameSerializer
  attributes :formats
  has_many :formats, serializer: FormatSerializer
end
