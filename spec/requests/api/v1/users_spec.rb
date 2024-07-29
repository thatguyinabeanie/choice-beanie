require 'swagger_helper'
require_relative '../../../support/openapi/schema_helper'
require_relative '../../../support/openapi/response_helper'

RSpec.describe 'api/v1/users' do
  path('/api/v1/users') do
    get('List Users') do
      tags 'Users'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Retrieves a list of all Users'
      operationId 'listUsers'

      response(200, 'successful') do
        let(:users) { create_list(:user, 10) }

        schema type: :array, items: { '$ref' => '#/components/schemas/User' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    post('Create User') do
      tags 'Users'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      description 'Creates a new User.'
      operationId 'postUser'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            title: 'postUser',
            properties: {
              username: { type: :string },
              email: { type: :string },
              first_name: { type: :string },
              last_name: { type: :string },
              pronouns: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string }
            },
            required: %w[username email first_name last_name password password_confirmation]
          }
        }
      }

      response(201, 'created') do
        let(:user) do
          {
            user: {
              username: 'new_user',
              email: 'new_user@example.com',
              first_name: 'New ',
              last_name: 'User',
              pronouns: 'he/him',
              password: 'a_whole_new_world_1!',
              password_confirmation: 'a_whole_new_world_1!'
            }
          }
        end

        schema '$ref' => '#/components/schemas/UserDetails'

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:user) do
          {
            user: {
              username: '',
              email: 'new_user@example.com',
              first_name: 'New ',
              last_name: 'User',
              pronouns: 'he/him',
              password: 'a_whole_new_world_1!',
              password_confirmation: 'a_whole_new_world_1!'
            }
          }
        end

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end
  end

  path('/api/v1/users/{id}') do
    parameter name: :id, in: :path, type: :integer, description: 'ID of the User'

    get('Show User') do
      tags 'Users'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Retrieves a specific User by ID.'
      operationId 'getUser'

      response(200, 'successful') do
        let(:id) { create(:user, first_name: 'Existing', last_name: 'User').id }

        schema '$ref' => '#/components/schemas/UserDetails'

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    patch('Update User') do
      tags 'Users'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      description 'Updates an existing User.'
      operationId 'patchUser'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            title: 'patchUser',
            properties: {
              username: { type: :string },
              email: { type: :string },
              password: { type: :string },
              first_name: { type: :string },
              last_name: { type: :string },
              pronouns: { type: :string }
            },
            required: %w[username email password first_name last_name]
          }
        },
        required: %w[user]
      }

      response(200, 'successful') do
        let(:id) { create(:user).id }
        let(:user) do
          {
            user: {
              username: 'updated_user',
              pronouns: 'they/them',
              email: 'updateduser@example.com',
              first_name: 'Updated', last_name: 'Userrrrr',
              password: 'a_whole_new_world_1!', password_confirmation: 'a_whole_new_world_1!'
            }
          }
        end

        schema '$ref' => '#/components/schemas/User'

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }
        let(:user) do
          {
            user: {
              first_name: 'Updated', last_name: 'Userrrrr'
            }
          }
        end

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    delete('Delete User') do
      tags 'Users'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      describe 'Deletes a User by ID.'
      operationId 'deleteUser'

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:id) { user.id }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end
  end
end