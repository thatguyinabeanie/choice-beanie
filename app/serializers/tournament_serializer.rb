class TournamentSerializer < ActiveModel::Serializer
  attributes :id, :name, :player_cap
  # attributes :game, :format, :organization
  # belongs_to :game, serializer: GameSerializer
  # belongs_to :format, serializer: FormatSerializer
  # belongs_to :organization, serializer: OrganizationSerializer
end

class TournamentDetailsSerializer < TournamentSerializer
  attributes :registration_start_at, :registration_end_at, :late_registration
  attributes :check_in_required, :late_check_in, :check_in_start_at
  attributes :start_at, :started_at, :end_at, :ended_at
  attributes :autostart

  attributes :open_team_sheets, :teamlists_required

  # has_many :phases, serializer: PhaseSerializer
end
