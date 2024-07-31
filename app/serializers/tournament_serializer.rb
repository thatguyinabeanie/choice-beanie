class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :player_cap
  attributes :check_in_required, :late_registration
  attributes :registration_start_at, :registration_end_at
  attributes :start_at, :started_at, :end_at, :ended_at
  attributes :autostart
  # has_many :players, serializer: PlayerSerializer
end

class TournamentDetailSerializer < TournamentSerializer
  attributes :id, :name, :player_cap
  attributes :check_in_required, :late_registration
  attributes :registration_start_at, :registration_end_at
  attributes :start_at, :started_at, :end_at, :ended_at
  attributes :autostart
  # has_many :players, seri
  has_one :game, serializer: GameSerializer
  has_one :format, serializer: FormatSerializer
  has_one :organization, serializer: OrganizationSerializer
  has_many :phases, serializer: PhaseSerializer
end
