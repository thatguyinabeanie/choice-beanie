class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_at, :ended_at
  has_many :players, serializer: PlayerSerializer
end
