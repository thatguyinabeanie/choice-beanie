require 'swagger_helper'

RSpec.describe 'api/v1/games' do
  path '/api/v1/games' do
    get('List Games') do
      tags 'Games'
      produces 'application/json'
      description 'Retrieves a list of all games'

      # parameter name: :page, in: :query, type: :integer, description: 'Page number'
      # parameter name: :per_page, in: :query, type: :integer, description: 'Number of games per page'

      response(200, 'successful') do
        schema type: :array, items: { '$ref' => '#/components/schemas/Game' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              examples: {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          }
        end

        run_test!
      end

      response(400, 'bad request') do
        schema type: :object,
               properties: {
                 error: { type: :string }
               },
               required: ['error']

        let(:page) { 'invalid' }

        before do
          controller = Api::V1::GamesController.new
          allow(Api::V1::GamesController).to receive(:new).and_return(controller)
          allow(controller).to receive(:index).and_raise(ActionController::ParameterMissing.new(:page))
        end

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              examples: {
                example: JSON.parse(response.body, symbolize_names: true)
              }
            }
          }
        end

        run_test!
      end
    end

    post('Create Game') do
      tags 'Games'
      consumes 'application/json'
      produces 'application/json'
      description 'Creates a new game.'

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

      response(201, 'created') do
        let(:game) { { game: { name: 'New Game' } } }

        schema '$ref' => '#/components/schemas/Game'

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:game) { { title: '', genre: '' } }

        after { |example| set_example_response_metadata(example, response) }

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

      response(200, 'successful') do
        let(:id) { Game.create(name: 'Existing Game').id }

        schema '$ref' => '#/components/schemas/Game'

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' } # Define the id parameter here

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end

    patch('Update Game') do
      tags 'Games'
      produces 'application/json'
      consumes 'application/json'
      description 'Updates a game by ID.'

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

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }
        let(:game) { { game: { name: 'Updated Game' } } }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end

    delete('Delete Game') do
      tags 'Games'
      produces 'application/json'
      description 'Deletes a game by ID.'

      response(200, 'successful') do
        let(:game) { Game.create!(name: 'Test Game', slug: 'test-game') }
        let(:id) { game.id }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end
  end
end
