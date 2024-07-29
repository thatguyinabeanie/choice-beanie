require_relative '../../../serializers/game_serializer'

module Api
  module V1
    class GamesController < ApplicationController
      GAME_NOT_FOUND = 'Game not found'.freeze

      before_action :set_game, only: %i[show update destroy]

      # GET /api/v1/games
      # GET /api/v1/games.json
      def index
        @games = Game.all
        render json: @games, each_serializer: ::Serializer::Game, status: :ok
      end

      # GET /api/v1/games/:id
      # GET /api/v1/games/:id.json
      def show
        render json: @game, each_serializer: ::Serializer::Game, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: GAME_NOT_FOUND }, status: :not_found
      end

      # POST /api/v1/games
      # POST /api/v1/games.json
      def create
        @game = Game.new(game_params)

        if @game.save
          render json: @game, each_serializer: ::Serializer::Game, status: :created
        else
          render json: @game.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/games/:id
      # PATCH/PUT /api/v1/games/:id.json
      def update
        if @game.update(game_params)
          render json: @game, each_serializer: ::Serializer::Game, status: :ok
        else
          render json: { error: @game.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: GAME_NOT_FOUND }, status: :not_found
      end

      # DELETE /api/v1/games/:id
      # DELETE /api/v1/games/:id.json
      def destroy
        @game.destroy!
        render json: { message: 'Game deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: GAME_NOT_FOUND }, status: :not_found
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_game
        @game = Game.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def game_params
        params.require(:game).permit(:name)
      end
    end
  end
end
