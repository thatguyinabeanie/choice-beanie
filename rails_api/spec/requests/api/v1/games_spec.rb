require 'swagger_helper'
require_relative '../../../support/openapi/schema_helper'
require_relative '../../../support/openapi/response_helper'

RSpec.describe 'api/v1/games' do
  path '/api/v1/games' do
    get('List Games') do
      tags 'Games'
      produces 'application/json'
      description 'Retrieves a list of all games'
      operationId 'getGames'

      # parameter name: :page, in: :query, type: :integer, description: 'Page number'
      # parameter name: :per_page, in: :query, type: :integer, description: 'Number of games per page'

      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/Game' }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(400, 'bad request') do
        OpenApi::Schema.bad_request

        let(:page) { 'invalid' }

        before do
          controller = Api::V1::GamesController.new
          allow(Api::V1::GamesController).to receive(:new).and_return(controller)
          allow(controller).to receive(:index).and_raise(ActionController::ParameterMissing.new(:page))
        end

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    post('Create Game') do
      tags 'Games'
      consumes 'application/json'
      produces 'application/json'
      description 'Creates a new game.'
      operationId 'createGame'

      parameter name: :game, in: :body, schema: {
        type: :object,
        properties: {
          game: {
            type: :object,
            title: 'postGame',
            properties: {
              name: { type: :string }
            },
            required: %w[name]
          }
        },
        required: %w[game]
      }

      response(201, 'created') do
        let(:game) { { game: { name: 'New Game' } } }

        schema '$ref' => '#/components/schemas/Game'

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:game) { { title: '', genre: '' } }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end
  end

  path '/api/v1/games/{id}' do
    # You'll want to customize the parameter types...
    parameter name: :id, in: :path, type: :string, description: 'ID of the game'

    get('Show Game') do
      tags 'Games'
      produces 'application/json'
      description 'Retrieves a specific game by ID.'
      operationId 'getGame'

      response(200, 'successful') do
        let(:id) { Game.create(name: 'Existing Game').id }

        schema '$ref' => '#/components/schemas/Game'

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' } # Define the id parameter here

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    patch('Update Game') do
      tags 'Games'
      produces 'application/json'
      consumes 'application/json'
      description 'Updates a game by ID.'
      operationId 'patchGame'

      parameter name: :game, in: :body, schema: {
        type: :object,
        properties: {
          game: {
            type: :object,
            properties: {
              name: { type: :string }
            },
            required: %w[name]
          }
        },
        required: %w[game]
      }

      response(200, 'successful') do
        let(:id) { Game.create(name: 'Existing Game').id }
        let(:game) { { game: { name: 'Updated Game' } } }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }
        let(:game) { { game: { name: 'Updated Game' } } }

        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    delete('Delete Game') do
      tags 'Games'
      produces 'application/json'
      description 'Deletes a game by ID.'
      operationId 'deleteGame'

      response(200, 'successful') do
        let(:game) { Game.create!(name: 'Test Game', slug: 'test-game') }
        let(:id) { game.id }

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