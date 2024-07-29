# typed:

module Api
  module V1
    class UsersController < ApplicationController
      USER_NOT_FOUND = 'User not found'.freeze

      before_action :set_user, only: %i[show update destroy]

      # GET /api/v1/users
      def index
        @users = User.all
        # render json: @users.as_json(only: %i[id username pronouns slug])
        render json: @users.as_json
      end

      # GET /api/v1/users/:id
      def show
        render json: @user.as_json(only: %i[id username pronouns])
      rescue ActiveRecord::RecordNotFound
        render json: { error: USER_NOT_FOUND }, status: :not_found
      end

      # POST /api/v1/users
      def create
        p = params.require(:user).permit(:username, :email, :first_name, :last_name, :pronouns, :password, :password_confirmation)
        @user = User.new p
        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      rescue ActionController::ParameterMissing => e
        render json: { error: e.message }, status: :bad_request
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        if @user.update(user_params)
          render json: @user
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

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.require(:user).permit(:id, :username, :email, :pronouns, :first_name, :last_name)
      end
    end
  end
end
