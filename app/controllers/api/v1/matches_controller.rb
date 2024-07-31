module Api
  module V1
    class MatchesController < AbstractApplicationController
      before_action :set_match, only: %i[show update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
      self.klass = ::Tournament::Match
      self.serializer_klass = ::MatchSerializer
      self.detail_serializer_klass = ::MatchDetailsSerializer

      protected

      def permitted_params
        params.require(:match).permit(:round_id, :tournament_id, :table_number, :player1_id, :player2_id, :winner_id, :loser_id, :player_one_check_in, :player_two_check_in)
      end

      private

      def set_match
        @match = set_object
      end
    end
  end
end
