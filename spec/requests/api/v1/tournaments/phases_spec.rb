require 'swagger_helper'
require_relative '../../../../support/openapi/schema_helper'
require_relative '../../../../support/openapi/response_helper'

PHASES_ENUM = %w[Phase::Swiss Phase::SingleElimination].freeze

RSpec.describe 'api/v1/tournaments/:tournament_id/phases' do
  path('/api/v1/tournaments/{tournament_id}/phases') do
    parameter name: :tournament_id, in: :path, type: :integer, description: 'ID of the tournament', required: true

    get('List Tournament Phases') do
      tags 'Phases'
      produces 'application/json'
      description 'Retrieves a list of all Phases'
      operationId 'listTournamentPhases'

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }

        let(:tournament_id) { tournament.id }
        let(:phases) { create_list(:swiss_phase, 2, tournament:) }

        schema type: :array, items: { '$ref' => '#/components/schemas/Phase' }

        run_test!

        response(404, 'not found') do
          let(:tournament_id) { 'invalid' }

          OpenApi::Response.set_example_response_metadata
          run_test!
        end
      end
    end

    post('Create Tournament Phase') do
      tags 'Phases'
      produces 'application/json'
      consumes 'application/json'
      description 'Creates a new Tournament Phase.'
      operationId 'postTournamentPhase'

      parameter name: :phase, in: :body, schema: {
        type: :object,
        properties: {
          phase: {
            type: :object,
            title: 'postPhase',
            properties: {
              number_of_rounds: { type: :integer },
              best_of: { type: :integer },
              type: { type: :string, enum: PHASES_ENUM }
            },
            required: %w[number_of_rounds best_of type]
          }
        }
      }, required: true

      response(201, 'created') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:phase) do
          {
            phase: {
              name: 'Swiss Round',
              number_of_rounds: 3,
              best_of: 3,
              type: 'Phase::Swiss'
            }
          }
        end

        schema '$ref' => '#/components/schemas/PhaseDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response 404, 'not found' do
        let(:tournament_id) { 'invalid' }
        let(:phase) do
          {
            phase: {
              number_of_rounds: 3,
              best_of: 3,
              type: 'Phase::Swiss'
            }
          }
        end

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end
  end

  path('/api/v1/tournaments/{tournament_id}/phases/{id}') do
    parameter name: :tournament_id, in: :path, type: :integer, description: 'ID of the tournament', required: true

    get('Show Tournament Phase') do
      tags 'Phases'
      produces 'application/json'
      description 'Retrieves a Tournament Phase'
      operationId 'showTournamentPhase'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID of the Phase'

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:phase) { create(:swiss_phase, tournament:) }

        let(:tournament_id) { tournament.id }
        let(:id) { phase.id }

        schema '$ref' => '#/components/schemas/PhaseDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!

        response(404, 'not found') do
          let(:tournament) { create(:tournament) }
          let(:id) { 'invalid' }

          OpenApi::Response.set_example_response_metadata
          run_test!
        end
      end
    end

    put('Update Tournament Phase') do
      tags 'Phases'
      produces 'application/json'
      consumes 'application/json'
      description 'Updates a Tournament Phase.'
      operationId 'putTournamentPhase'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID of the Phase'

      parameter name: :phase, in: :body, schema: {
        type: :object,
        properties: {
          phase: {
            type: :object,
            title: 'putPhase',
            properties: {
              name: { type: :string },
              number_of_rounds: { type: :integer },
              best_of: { type: :integer },
              type: { type: :string, enum: PHASES_ENUM }
            }
          }
        }
      }, required: true

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:tour_phase) { create(:swiss_phase, tournament:) }

        let(:tournament_id) { tournament.id }
        let(:id) { tour_phase.id }
        let(:phase) do
          {
            phase: {
              name: 'Swiss Round',
              number_of_rounds: 3,
              best_of: 3,
              type: 'Phase::Swiss'
            }
          }
        end

        schema '$ref' => '#/components/schemas/PhaseDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!

        response(404, 'not found') do
          let(:tournament) { create(:tournament) }
          let(:id) { 'invalid' }
          let(:phase) do
            {
              phase: {
                name: 'Swiss Round',
                number_of_rounds: 3,
                best_of: 3,
                type: 'Phase::Swiss'
              }
            }
          end

          OpenApi::Response.set_example_response_metadata
          run_test!
        end
      end
    end

    delete('Delete Tournament Phase') do
      tags 'Phases'
      produces 'application/json'
      description 'Deletes a Tournament Phase.'
      operationId 'deleteTournamentPhase'

      parameter name: :id, in: :path, type: :integer, required: true, description: 'ID of the Phase'

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:phase) { create(:swiss_phase, tournament:) }

        let(:tournament_id) { tournament.id }
        let(:id) { phase.id }

        OpenApi::Response.set_example_response_metadata
        run_test!
      end

      response(404, 'not found') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end
  end
end
