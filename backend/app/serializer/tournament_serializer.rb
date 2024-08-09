require_relative 'serializer_mixin'
require_relative 'game_serializer'
require_relative 'format_serializer'
require_relative 'organization_serializer'

module Serializer
  module TournamentMixin
    extend ActiveSupport::Concern
    included do
      class_attribute :organization_serializer

      include SerializerMixin::Id
      include SerializerMixin::Name
      attributes :player_cap
      attributes :game, :format
      attributes :organization
      belongs_to :game, serializer: Serializer::Game
      belongs_to :format, serializer: Serializer::Format

      def organization
        @organization ||= organization_serializer.new(object.organization)
      end
    end
  end

  class Tournament < ActiveModel::Serializer
    include TournamentMixin
    self.organization_serializer = Serializer::Organization
  end

  class TournamentDetails < ActiveModel::Serializer
    include TournamentMixin
    self.organization_serializer = Serializer::Organization

    attributes :registration_start_at, :registration_end_at, :late_registration
    attributes :late_check_in, :check_in_start_at
    attributes :start_at, :started_at, :end_at, :ended_at
    attributes :autostart
    # attributes :description
    attributes :open_team_sheets, :teamlists_required

    # has_many :phases, serializer: PhaseSerializer
  end
end
