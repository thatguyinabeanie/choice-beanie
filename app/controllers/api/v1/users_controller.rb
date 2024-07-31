require_relative '../../../serializers/user_serializer'

module Api
  module V1
    class UsersController < AbstractApplicationController
      before_action :set_user, only: %i[show update destroy] # rubocop:disable Rails/LexicallyScopedActionFilter
      self.klass = User
      self.serializer_klass = ::UserSerializer
      self.detail_serializer_klass = ::UserDetailSerializer

      protected

      # Only allow a list of trusted parameters through.
      def permitted_params
        params.require(:user).permit(:id, :username, :email, :pronouns, :first_name, :last_name, :password, :password_confirmation, :slug)
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = set_object
      end
    end
  end
end
