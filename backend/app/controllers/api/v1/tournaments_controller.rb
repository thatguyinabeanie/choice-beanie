require_relative '../../../serializer/tournament_serializer'
module Api
  module V1
    class TournamentsController < ApiController
      before_action :set_organization
      before_action :set_tournaments, only: %i[index show]
      before_action :set_tournament, only: %i[show update destroy]

      def index
        render json: @tournaments, each_serializer: Serializer::Tournament, status: :ok
      end

      def show
        render json: serialize_details, status: :ok
      end

      def create
        @tournament = ::Tournament::Tournament.new permitted_params.merge(organization: @organization)
        if @tournament.save
          render json: serialize_details, status: :created
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :bad_request
      end

      def update
        if @tournament.update! permitted_params
          render json: serialize_details, status: :ok
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @tournament.destroy!
        render json: { message: 'Tournament deleted' }, status: :ok
      end

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
        @tournaments ||= set_tournaments
        @tournament = @tournaments.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Tournament not found' }, status: :not_found
      end

      def set_tournaments
        @organization ||= set_organization
        @tournaments ||= @organization.tournaments
        @tournaments
      end

      def set_organization
        @organization = if params[:organization_id].present?
                          ::Organization.find(params[:organization_id])
                        else
                          ::Tournament::Tournament.find(params[:id]).organization
                        end
        @organization
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Organization not found' }, status: :not_found
      end

      def serialize_details
        Serializer::TournamentDetails.new(@tournament).serializable_hash
      end

      # Only allow a list of trusted parameters through.
      def permitted_params
        params.require(:tournament).permit(
          :name,
          :start_at, :end_at,
          :game_id, :format_id,
          :autostart, :player_cap,
          :registration_start_at, :registration_end_at, :late_registration,
          :late_check_in, :check_in_start_at, :check_in_end_at,
          :open_team_sheets, :teamlists_required
        )
      end
    end
  end
end
