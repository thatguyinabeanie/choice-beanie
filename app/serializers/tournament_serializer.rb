module Serializer
  class Tournament < ActiveModel::Serializer
    attributes :id, :name, :player_cap
    attributes :check_in_required, :late_registration
    attributes :registration_start_at, :registration_end_at
    attributes :start_at, :started_at, :end_at, :ended_at
    attributes :autostart
    # has_many :players, serializer: PlayerSerializer
  end

  class TournamentDetails < Tournament
    has_one :game, serializer: Serializer::Game
    has_one :format, serializer: Serializer::Format
    has_one :organization, serializer: Serializer::Organization
    has_many :phases, serializer: Serializer::Phase
  end
end
