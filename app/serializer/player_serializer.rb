require_relative 'user_serializer'
require_relative 'pokemon_set_serializer'

module Serializer
  module PlayerMixin
    extend ActiveSupport::Concern
    included do
      include IdMixin

      attributes :in_game_name, :checked_in_at, :checked_in
      attributes :team_sheet_submitted, :team_sheet_submitted_at

      belongs_to :user, serializer: Serializer::User

      def checked_in
        object.checked_in_at.present?
      end

      def team_sheet_submitted
        object.pokemon_sets.present? || object.pokemon_sets.any?
      end

      def team_sheet_submitted_at
        object.pokemon_sets.maximum(:updated_at) || object.pokemon_sets.maximum(:created_at)
      end
    end
  end

  class Player < ActiveModel::Serializer
    include PlayerMixin
  end

  class PlayerDetails < ActiveModel::Serializer
    include PlayerMixin
    has_many :pokemon_sets, serializer: Serializer::PokemonSet
  end
end
