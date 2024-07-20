module Api
  module V1
    module Tournament
      class RegistrationsController < ApplicationController
        before_action :set_tournament

        # GET /api/v1/tournaments/:tournament_id/registrations
        def index
          @registrations = @tournament.registrations
          render json: @registrations, each_serializer: ::RegistrationSerializer
        end

        # POST /api/v1/tournaments/:tournament_id/registrations
        def create
          @registration = @tournament.registrations.new(registration_params)
          if @registration.save
            render json: @registration, status: :created
          else
            render json: @registration.errors, status: :unprocessable_entity
          end
        end

        # DELETE /api/v1/tournaments/:tournament_id/registrations/:id
        def destroy
          @registration = @tournament.registrations.find(params[:id])
          @registration.destroy
          head :no_content
        end

        private

        def set_tournament
          @tournament = ::Tournament::Tournament.find(params[:tournament_id])
        end

        def registration_params
          params.require(:registration).permit(:player_id, :other_attributes)
        end
      end
    end
  end
end
