require_relative '../../../serializers/organization_serializer'
require_relative '../../../serializers/user_serializer'

module Api
  module V1
    class OrganizationsController < AbstractApplicationController
      before_action :set_organization, only: %i[show update destroy staff] # rubocop:disable Rails/LexicallyScopedActionFilter

      self.klass = ::Organization::Organization
      self.serializer_klass = ::Serializer::Organization
      self.detail_serializer_klass = ::Serializer::OrganizationDetails

      def staff
        # Assuming there's an association called `staff_members` you can directly use it
        # If not, replace `organization.staff_members` with your logic to fetch staff members
        render json: @organization.staff, each_serializer: ::Serializer::User, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Organization not found' }, status: :not_found
      end

      private

      def set_organization
        @organization = set_object
      end

      def permitted_params
        params.require(:organization).permit(:name, :description, :owner_id)
      end
    end
  end
end
