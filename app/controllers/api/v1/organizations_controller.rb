module Api
  module V1
    class OrganizationsController < ApplicationController
      ORGANIZATION_NOT_FOUND = 'Organization not found'.freeze
      def index
        # Logic to fetch all organizations
        organizations = Organization::Organization.all
        render json: organizations
      end

      def show
        # Logic to fetch a specific organization
        organization = Organization::Organization.friendly.find(params[:id])
        render json: organization
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def create
        # Logic to create a new organization
        organization = Organization::Organization.new(organization_params)
        if organization.save
          render json: organization, status: :created
        else
          render json: { error: organization.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        # Logic to update an existing organization
        organization = Organization::Organization.find(params[:id])
        if organization.update(organization_params)
          render json: organization
        else
          render json: { error: organization.errors.full_messages }, status: :unprocessable_entity
        end
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def destroy
        # Logic to delete an organization
        organization = Organization::Organization.find(params[:id])
        organization.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      def staff
        organization = Organization::Organization.find(params[:id])
        # Assuming there's an association called `staff_members` you can directly use it
        # If not, replace `organization.staff_members` with your logic to fetch staff members
        render json: organization.staff, each_serializer: ::UserSerializer
      rescue ActiveRecord::RecordNotFound
        render json: { error: ORGANIZATION_NOT_FOUND }, status: :not_found
      end

      private

      def organization_params
        params.require(:organization).permit(:name, :description, :location)
      end
    end
  end
end
