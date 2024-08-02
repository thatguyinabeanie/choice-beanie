# frozen_string_literal: true

require_relative '../../../lib/helpers/JWT/token_handler'

module Users
  class SessionsController < Devise::SessionsController
    respond_to :json

    private

    def respond_with(resource, _opts = {})
      render json: { token: current_token }, status: :ok
    end

    def respond_to_on_destroy
      head :no_content
    end

    def current_token
      request.env['warden-jwt_auth.token']
    end
    # include RackSessionsFix

    # def create
    #   user = User.find_by(email: params[:email])
    #   if user&.authenticate(params[:password])
    #     render json: { token: user.generate_jwt }, status: :created
    #   else
    #     render json: { error: 'Invalid email or password' }, status: :unauthorized
    #   end
    # end

    # def respond_with(current_user, _opts = {})
    #   render json: {
    #     status: {
    #       code: 200, message: 'Logged in successfully.',
    #       data: {
    #         user: Serializer::User.new(current_user).serializable_hash[:data][:attributes]
    #       }
    #     }
    #   }, status: :ok
    # end

    # def respond_with(resource, _opts = {})
    #   render json: { token: current_token }, status: :ok
    # end

    # def respond_to_on_destroy
    #   current_user = find_user_from_jwt
    #   return render_unauthorized unless current_user

    #   render json: {
    #     status: 200,
    #     message: 'Logged out successfully.'
    #   }, status: :ok
    # end

    # private

    # def find_user_from_jwt
    #   jwt_payload = Helpers::JWT::TokenHandler.jwt_payload(request)
    #   return nil unless jwt_payload

    #   User.find_by(id: jwt_payload['sub'])
    # end

    # def render_unauthorized
    #   render json: {
    #     status: 401,
    #     message: "Couldn't find an active session."
    #   }, status: :unauthorized
    # end
  end
end
