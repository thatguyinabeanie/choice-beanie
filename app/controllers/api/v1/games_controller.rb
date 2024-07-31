require_relative '../../../serializers/game_serializer'

module Api
  module V1
    class GamesController < AbstractApplicationController
      before_action :set_game, only: %i[show update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter

      self.klass = ::Game
      self.serializer_klass = ::GameSerializer
      self.detail_serializer_klass = ::GameDetailsSerializer

      protected

      def permitted_params
        params.require(:game).permit(:name)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = set_object
      end
    end
  end
end
