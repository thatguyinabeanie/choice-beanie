require_relative '../../../../serializers/player_serializer'

module Api
  module V1
    module Tournament
      class PlayersController < ApplicationController
        before_action :set_tournament
        before_action :set_players, only: %i[index create]
        before_action :set_player, only: %i[show update destroy]

        # GET /api/v1/tournaments/:tournament_id/players
        # GET /api/v1/tournaments/:tournament_id/players.json
        def index
          render json: @players, each_serializer: ::PlayerSerializer, status: :ok
        end

        # GET /api/v1/tournaments/:tournament_id/players/:id
        # GET /api/v1/tournaments/:tournament_id/players/:id.json
        def show
          render json: @player, status: :ok
        end

        # POST /api/v1/tournaments/:tournament_id/players
        def create
          @player = @players.create! permitted_params
          if @player.save
            render json: @player, status: :created
          else
            render json: @player.errors, status: :unprocessable_entity
          end
        rescue ActionController::ParameterMissing => e
          render json: { error: e.message }, status: :bad_request
        end

        # PATCH/PUT /api/v1/tournaments/:tournament_id/players/:id
        # PATCH/PUT /api/v1/tournaments/:tournament_id/players/:id.json
        def update
          if @player.update! permitted_params
            render json: @player, status: :ok
          else
            render json: @player.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/tournaments/:tournament_id/players/:id
        # DELETE /api/v1/tournaments/:tournament_id/players/:id.json
        def destroy
          @player.destroy!
          render json: { message: 'Player deleted' }, status: :ok
        end

        private

        def set_tournament
          @tournament = ::Tournament::Tournament.find(params[:tournament_id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Tournament not found' }, status: :not_found
        end

        def set_players
          @players = @tournament.players
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Tournament not found' }, status: :not_found
        end

        def set_player
          set_players
          @player = @players.find_by(user_id: params[:id])
        rescue ActiveRecord::RecordNotFound
          render json: { error: 'Player not found' }, status: :not_found
        end

        def permitted_params
          params.require(:player).permit(:user_id, :team_sheet_submitted, :checked_in, :tournament_id, :id, :username)
        end
      end
    end
  end
end
