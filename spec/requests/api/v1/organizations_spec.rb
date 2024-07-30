require 'swagger_helper'
require_relative '../../../support/openapi/schema_helper'
require_relative '../../../support/openapi/response_helper'

ORGANIZATION_DETAIL_SCHEMA = '#/components/schemas/OrganizationDetails'.freeze
DESCRIPTION = 'the bomb dot com'.freeze
RSpec.describe 'api/v1/organizations' do
  path('/api/v1/organizations') do
    get('List Organizations') do
      tags 'Organizations'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      operationId 'listOrganizations'

      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/Organization' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    post('Create Organization') do
      tags 'Organizations'
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Creates a new organization.'
      operationId 'postOrganization'

      parameter name: :organization, in: :body, schema: {
        type: :object,
        properties: {
          organization: {
            type: :object,
            title: 'postOrganization',
            properties: {
              name: { type: :string },
              description: { type: :string },
              owner_id: { type: :integer }
            },
            required: %w[name description]
          }
        }
      }

      response(201, 'created') do
        let(:owner) { create(:user) }
        let(:organization) do
          {
            organization: {
              name: 'New Organization',
              description: DESCRIPTION,
              owner_id: owner.id
            }
          }
        end

        schema '$ref' => ORGANIZATION_DETAIL_SCHEMA
        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end
  end

  path('/api/v1/organizations/{id}') do
    parameter name: :id, in: :path, type: :string, required: true

    get('Show Organization') do
      tags 'Organizations'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Retrieves a specific organization.'
      operationId 'getOrganization'

      response(200, 'successful') do
        let(:organization) { create(:organization) }
        let(:id) { organization.id }

        schema '$ref' => ORGANIZATION_DETAIL_SCHEMA
        OpenApi::Response.set_example_response_metadata
        run_test!
      end

      response(404, NOT_FOUND) do
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    patch('Update Organization') do
      tags 'Organizations'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      description 'Updates an existing organization.'
      operationId 'patchOrganization'

      parameter name: :organization, in: :body, schema: {
        type: :object,
        properties: {
          organization: {
            type: :object,
            title: 'patchOrganization',
            properties: {
              name: { type: :string },
              description: { type: :string },
              owner_id: { type: :integer }
            },
            required: %w[name description]
          }
        }
      }

      response(200, 'successful') do
        let(:id) { create(:organization).id }
        let(:organization) do
          {
            organization: {
              name: 'Updated Organization',
              description: DESCRIPTION
            }
          }
        end

        schema '$ref' => ORGANIZATION_DETAIL_SCHEMA
        OpenApi::Response.set_example_response_metadata
        run_test!
      end

      response(404, NOT_FOUND) do
        let(:id) { -1 }
        let(:organization) do
          {
            organization: {
              name: 'Updated Organization',
              description: DESCRIPTION
            }
          }
        end

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    delete('Delete Organization') do
      tags 'Organizations'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Deletes an organization.'
      operationId 'deleteOrganization'

      response(200, 'Organization deleted') do
        let(:organization) { create(:organization) }
        let(:id) { organization.id }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, NOT_FOUND) do
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end
  end
end
