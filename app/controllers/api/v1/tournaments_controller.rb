require_relative '../../../serializers/tournament_serializer'
module Api
  module V1
    class TournamentsController < ApplicationController
      TOURNAMENT_NOT_FOUND = 'Tournament not found'.freeze
      before_action :set_tournament, only: %i[show update destroy]

      # GET /api/v1/tournaments
      def index
        @tournaments = ::Tournament::Tournament.all
        render json: @tournaments, each_serializer: ::TournamentSerializer, status: :ok
      end

      # GET /api/v1/tournaments/:id
      def show
        render json: serialize_tournament, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: TOURNAMENT_NOT_FOUND }, status: :not_found
      end

      # POST /api/v1/tournaments
      def create
        @tournament = ::Tournament::Tournament.new(tournament_params)
        if @tournament.save
          render json: serialize_tournament, status: :created_at
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :bad_request
      end

      # PATCH/PUT /api/v1/tournaments/:id
      def update
        if @tournament.update(tournament_params)
          render serialize_tournament, status: :ok
        else
          render json: @tournament.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: TOURNAMENT_NOT_FOUND }, status: :not_found
      end

      # DELETE /api/v1/tournaments/:id
      def destroy
        @tournament.destroy
        render json: { message: 'Tournament deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: TOURNAMENT_NOT_FOUND }, status: :not_found
      end

      # TODO: Implement the following actions
      # GET /api/v1/tournaments/:id/players
      # GET /api/v1/tournaments/:id/phases
      # POST /api/v1/tournaments/:id/phases
      # PATCH/PUT /api/v1/tournaments/:id/phases/:phase_id
      # DELETE /api/v1/tournaments/:id/phases/:phase_id
      # GET /api/v1/tournaments/:id/players

      private

      def serialize_tournament
        ::TournamentDetailSerializer.new(@tournament).attributes
      end

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
