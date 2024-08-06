require_relative 'serializer_mixin'

module Serializer
  module TournamentMixin
    extend ActiveSupport::Concern
    included do
      include SerializerMixin::Id
      include SerializerMixin::Name
      attributes :player_cap
      # attributes :game, :format, :organization
      # belongs_to :game, serializer: GameSerializer
      # belongs_to :format, serializer: Serializer::Format
      # belongs_to :organization, serializer: OrganizationSerializer
    end
  end

  class Tournament < ActiveModel::Serializer
    include TournamentMixin
    # attributes :game, :format, :organization
    # belongs_to :game, serializer: GameSerializer
    # belongs_to :format, serializer: Serializer::Format
    # belongs_to :organization, serializer: OrganizationSerializer
  end

  class TournamentDetails < ActiveModel::Serializer
    include TournamentMixin

    attributes :registration_start_at, :registration_end_at, :late_registration
    attributes :late_check_in, :check_in_start_at
    attributes :start_at, :started_at, :end_at, :ended_at
    attributes :autostart

    attributes :open_team_sheets, :teamlists_required

    # has_many :phases, serializer: PhaseSerializer
  end
end
