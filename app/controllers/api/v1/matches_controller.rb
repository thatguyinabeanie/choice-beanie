module Api
  module V1
    class MatchesController < ApplicationController
      before_action :set_match, only: %i[show update destroy]
      def index
        @matches = Match.all
        render json: @matches
      end

      def show
        render json: @match
      end

      def create
        @match = Match.new(match_params)
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
        head :no_content
      end

      private

      def set_match
        @match = Match.find(params[:id])
      end

      def match_params
        params.require(:match).permit(:name, :date, :location)
      end
    end
  end
end
