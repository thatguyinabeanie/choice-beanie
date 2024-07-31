require_relative '../../../serializers/tournament_serializer'
module Api
  module V1
    class TournamentsController < AbstractApplicationController
      before_action :set_tournament, only: %i[show update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter

      self.klass = ::Tournament::Tournament
      self.serializer_klass = ::TournamentSerializer
      self.detail_serializer_klass = ::TournamentDetailsSerializer

      # TODO: Implement the following actions
      # GET /api/v1/tournaments/:id/players
      # GET /api/v1/tournaments/:id/phases
      # POST /api/v1/tournaments/:id/phases
      # PATCH/PUT /api/v1/tournaments/:id/phases/:phase_id
      # DELETE /api/v1/tournaments/:id/phases/:phase_id
      # GET /api/v1/tournaments/:id/players

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_tournament
        @tournament = set_object
      end

      # Only allow a list of trusted parameters through.
      def permitted_params
        params.require(:tournament).permit(:name, :start_at, :end_date)
      end
    end
  end
end
