require_relative '../../../serializers/user_serializer'

module Api
  module V1
    class UsersController < ApplicationController
      USER_NOT_FOUND = 'User not found'.freeze

      before_action :set_user, only: %i[show update destroy]

      # GET /api/v1/users
      def index
        @users = User.all
        # render json: @users.as_json(only: %i[id username pronouns slug])
        render json: @users, each_serializer: ::UserSerializer, status: :ok
      end

      # GET /api/v1/users/:id
      def show
        render json: serialize_user_details, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: USER_NOT_FOUND }, status: :not_found
      end

      # POST /api/v1/users
      def create
        @user = User.new user_params
        if @user.save
          render json: serialize_user_details, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :bad_request
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        if @user.update(user_params)
          render json: serialize_user_details, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: USER_NOT_FOUND }, status: :not_found
      end

      # DELETE /api/v1/users/:id
      def destroy
        @user.destroy
        render json: { message: 'User deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: USER_NOT_FOUND }, status: :not_found
      end

      private

      def serialize_user_details
        ::UserDetailsSerializer.new(@user).attributes
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:id, :username, :email, :pronouns, :first_name, :last_name, :password, :password_confirmation, :slug)
      end
    end
  end
end
