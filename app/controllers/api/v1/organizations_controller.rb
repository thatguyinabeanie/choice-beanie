require_relative '../../../serializers/organization_serializer'
require_relative '../../../serializers/user_serializer'

module Api
  module V1
    class OrganizationsController < ApplicationController
      ORGANIZATION_NOT_FOUND = 'Organization not found'.freeze
      before_action :set_organization, only: %i[show update destroy]
      def index
        # Logic to fetch all organizations
        @organizations = Organization::Organization.all
        render json: @organizations, each_serializer: ::Serializer::Organization, status: :ok
      end

      def show
        render json: serialize_org_details, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def create
        # Logic to create a new organization
        @organization = Organization::Organization.new organization_params

        if @organization.save
          render json: serialize_org_details, status: :created
        else
          render json: { error: @organization.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @organization.update(organization_params)
          render json: serialize_org_details, status: :ok
        else
          render json: { error: @organization.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def destroy
        @organization.destroy
        render json: { message: 'Organization deleted' }, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def staff
        # Assuming there's an association called `staff_members` you can directly use it
        # If not, replace `organization.staff_members` with your logic to fetch staff members
        render json: @organization.staff, each_serializer: ::Serializer::User, status: :ok
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      private

      def serialize_org_details
        ::Serializer::OrganizationDetails.new(@organization).attributes
      end

      def set_organization
        @organization = Organization::Organization.friendly.find(params[:id])
      end

      def organization_params
        params.require(:organization).permit(:name, :description, :owner_id)
      end
    end
  end
end
