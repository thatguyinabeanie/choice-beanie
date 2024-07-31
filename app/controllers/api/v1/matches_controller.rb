module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: %i[show update destroy]

      def index
        @matches = ::Tournament::Match.all
        render json: @matches
      end

      def show
        render json: @match
      end

      def create
        @match = ::Tournament::Match.new(match_params)
        if @match.save
          render json: @match, status: :created
        else
          render json: @match.errors, status: :unprocessable_entity
        end
      end

      def update
        if @match.update(match_params)
          render json: @match
        else
          render json: @match.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @match.destroy
        render json: { message: 'Match deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Match not found' }, status: :not_found
      end

      private

      def set_match
        @match = ::Tournament::Match.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'User not found' }, status: :not_found
      end

      def match_params
        params.require(:match).permit(:round_id, :tournament_id, :table_number, :player1_id, :player2_id, :winner_id, :loser_id, :player_one_check_in, :player_two_check_in)
      end
    end
  end
end
