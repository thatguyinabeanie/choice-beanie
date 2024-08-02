require_relative '../../../serializer/user_serializer'

module Api
  module V1
    class UsersController < AbstractApplicationController
      before_action :set_user, only: %i[show update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
      self.klass = User
      self.serializer_klass = Serializer::User
      self.detail_serializer_klass = Serializer::UserDetails

      # PATCH/PUT /api/v1/users/:id
      # PATCH/PUT /api/v1/users/:id.json
      def update
        if @user.update permitted_params.except(:password, :password_confirmation)
          render json: serialize_details, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH /api/v1/users/:id/password
      # PATCH /api/v1/users/:id/password.json
      def patch_password
        password_params = params.require(:user).permit(:password, :password_confirmation, :current_password)
        if @user.update_with_password(password_params)
          render json: { message: 'Password updated successfully' }, status: :ok
        else
          render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
        end
      end

      protected

      # Only allow a list of trusted parameters through.
      def permitted_params
        params.require(:user).permit(:id, :username, :email, :pronouns, :first_name, :last_name, :password, :password_confirmation)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = set_object
      end
    end
  end
end
