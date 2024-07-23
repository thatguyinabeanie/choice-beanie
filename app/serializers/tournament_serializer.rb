class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :ended_at
  has_many :players, serializer: PlayerSerializer
end
