module Api
  module V1
    class TournamentsController < ApplicationController
      before_action :set_tournament, only: %i[show update destroy]

      # GET /api/v1/tournaments
      def index
        @tournaments = ::Tournament::Tournament.all
        render json: @tournaments, each_serializer: ::Serializer::Tournament, status: :ok
      end

      # GET /api/v1/tournaments/:id
      def show
        render json: @tournament, each_serializer: ::Serializer::TournamentDetails, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Tournament not found' }, status: :not_found
      end

      # POST /api/v1/tournaments
      def create
        @tournament = ::Tournament::Tournament.new(tournament_params)
        if @tournament.save
          render json: @tournament, status: :created, each_serializer: ::Serializer::TournamentDetails
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :bad_request
      end

      # PATCH/PUT /api/v1/tournaments/:id
      def update
        if @tournament.update(tournament_params)
          render json: @tournament, status: :ok, each_serializer: ::Serializer::TournamentDetails
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Tournament not found' }, status: :not_found
      end

      # DELETE /api/v1/tournaments/:id
      def destroy
        @tournament.destroy
        render json: { message: 'Tournament deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Tournament not found' }, status: :not_found
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
        @tournament = ::Tournament::Tournament.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def tournament_params
        params.require(:tournament).permit(:name, :location, :start_at, :end_date)
      end
    end
  end
end
