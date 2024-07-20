module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: %i[show update]

      def index
        @matches = ::Tournament::Match.all
        render json: @matches
      end

      def show
        render json: @match
      end

      def update
        if @match.update(match_params)
          render json: @match
        else
          render json: @match.errors, status: :unprocessable_entity
        end
      end

      private

      def set_match
        @match = ::Tournament::Match.find(params[:id])
      end

      def match_params
        params.require(:match).permit(:name, :date, :location)
      end
    end
  end
end
