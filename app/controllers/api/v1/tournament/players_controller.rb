module Api
  module V1
    module Tournament
      class PlayersController < ApplicationController
        before_action :set_tournament

        # GET /api/v1/tournaments/:tournament_id/players
        def index
          @players = @tournament.players
          render json: @players, each_serializer: ::PlayerSerializer
        end

        # POST /api/v1/tournaments/:tournament_id/players
        def create
          @player = @tournament.players.new(player_params)
          if @player.save
            render json: @player, status: :created
          else
            render json: @player.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/tournaments/:tournament_id/players/:id
        def destroy
          @player = @tournament.players.find(params[:id])
          @player.destroy
          head :no_content
        end

        private

        def set_tournament
          @tournament = ::Tournament::Tournament.find(params[:tournament_id])
        end

        def player_params
          params.require(:player).permit(:user_id, :other_attributes)
        end
      end
    end
  end
end
