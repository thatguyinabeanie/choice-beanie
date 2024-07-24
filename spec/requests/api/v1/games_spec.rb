require 'swagger_helper'

RSpec.describe 'api/v1/games', type: :request do
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
          title: { type: :string },
          genre: { type: :string },
          release_date: { type: :string, format: :date }
        },
        required: ['title', 'genre']
      }

      response(201, 'created') do
        schema '$ref' => '#/components/schemas/Game'

        let(:game) { { title: 'New Game', genre: 'Action', release_date: '2023-01-01' } }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end

      response(422, 'unprocessable entity') do
        schema type: :object,
               properties: {
                 errors: { type: :object }
               },
               required: ['errors']

        let(:game) { { title: '', genre: '' } }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end
  end

  path '/api/v1/games/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('Show Game') do
      tags 'Games'
      produces 'application/json'
      description 'Retrieves a specific game by ID.'

      response(200, 'successful') do
        schema '$ref' => '#/components/schemas/Game'

        let(:id) { '123' }

        after { |example| set_example_response_metadata(example, response) }
        run_test!
      end

      response(404, 'not found') do
        after { |example| set_example_response_metadata(example, response) }
        run_test!
      end
    end

    patch('Update Game') do
      tags 'Games'
      produces 'application/json'
      description 'Updates a game by ID.'
      response(200, 'successful') do
        let(:id) { '123' }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end

    put('Update Game') do
      tags 'Games'
      produces 'application/json'
      description 'Updates a game by ID.'
      response(200, 'successful') do
        let(:id) { '123' }

        after { |example| set_example_response_metadata(example, response) }

        run_test!
      end
    end

    delete('Delete Game') do
      tags 'Games'
      produces 'application/json'
      description 'Deletes a game by ID.'

      response(200, 'successful') do
        let(:id) { '123' }
        after { |example| set_example_response_metadata(example, response) }
        run_test!
      end
    end
  end
end
