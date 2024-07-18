module Api
  module V1
    class GamesController < ApplicationController
      def index
        games = Game.all
        render json: games
      end

      def show
        # Your code here
        game = Game.find(params[:id])
        render json: game
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Game not found' }, status: :not_found
      end

      def create
        # Your code here
        game = Game.new(game_params)
        if game.save
          render json: game, status: :created
        else
          render json: { error: game.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        game = Game.find(params[:id])
        if game.update(game_params)
          render json: game
        else
          render json: { error: game.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Game not found' }, status: :not_found
      end

      def destroy
        game = Game.find(params[:id])
        game.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Game not found' }, status: :not_found
      end
    end
  end
end
