class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :ended_at
  has_many :registrations
end
