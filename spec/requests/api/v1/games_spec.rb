require 'swagger_helper'

RSpec.describe 'api/v1/games' do # rubocop:disable RSpec/EmptyExampleGroup
  path '/api/v1/games' do
    get 'LIST games' do
      tags 'Games'
      produces 'application/json'
      description 'List all games.'

      response(200, 'Returns a list of games') do
        schema type: :array,
               items: {
                 type: :object,
                 properties: {
                   id: { type: :integer },
                   name: { type: :string },
                   slug: { type: :string }
                 },
                 required: %w[id name slug]
               }
        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
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
      description 'Create a new game.'

      parameter name: :game, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer, example: 420 },
          name: { type: :string, example: 'Pokemon Scarlet & Violet' },
          slug: { type: :string, example: 'pokemon-scarlet-violet' }
        },
        required: %w[name slug]
      }

      response(201, 'Game Created') do
        let(:game) { { id: 420, name: 'Pokemon Scarlet & Violet', slug: 'pokemon-scarlet-violet' } }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end

      response(422, 'Unprocessable Entity') do
        let(:game) { { id: 420, name: nil, slug: nil } }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end

      response(422, 'Invalid Request') do
        let(:game) { { name: '' } } # Assuming the name is required and validation fails if it's blank
        run_test!
      end
    end
  end

  path '/api/v1/games/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show game') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    patch('update game') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    put('update game') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end

    delete('delete game') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example| # rubocop:disable RSpec/ScatteredSetup
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end

        run_test!
      end
    end
  end
end
