require 'swagger_helper'
require_relative '../../../support/openapi/schema_helper'
require_relative '../../../support/openapi/response_helper'

TOURNAMENT_DETAILS_SCHEMA_COMPONENT = '#/components/schemas/TournamentDetails'.freeze
RSpec.describe Api::V1::TournamentsController do
  path('/api/v1/organizations/{organization_id}/tournaments') do
    parameter name: :organization_id, in: :path, type: :integer, description: 'ID of the Organization', required: true
    let(:organization) { create(:organization) }
    let(:organization_id) { organization.id }

    get('List Tournaments') do
      tags 'Tournaments'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Retrieves a list of all Tournaments'
      operationId 'listTournaments'

      response(200, 'successful') do
        let(:organization) { create(:organization) }
        let(:organization_id) { organization.id }
        let(:tournaments) { create_list(:tournament, 10, organization:) }

        schema type: :array, items: { '$ref' => '#/components/schemas/Tournament' }

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end

    post('Create Tournament') do
      tags 'Tournaments'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      description 'Creates a new Tournament.'
      operationId 'postTournament'

      parameter name: :tournament, in: :body, schema: { '$ref' => '#/components/schemas/TournamentDetails' }

      response(201, 'created') do
        let(:game) { create(:game) }
        let(:format) { create(:format, game:) }
        let(:tournament) do
          {
            tournament: {
              name: 'new_tournament',
              game_id: game.id,
              format_id: format.id
            }
          }
        end

        schema '$ref' => TOURNAMENT_DETAILS_SCHEMA_COMPONENT

        OpenApi::Response.set_example_response_metadata
        run_test!
      end

      response(422, 'unprocessable entity') do
        let(:tournament) do
          {
            tournament: {
              name: 'new_tournament',
              start_at: Time.zone.now,
              end_date: 1.week.ago
            }
          }
        end

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end
  end

  path('/api/v1/organizations/{organization_id}/tournaments/{id}') do
    parameter name: :organization_id, in: :path, type: :integer, description: 'ID of the Organization', required: true
    parameter name: :id, in: :path, type: :integer, description: 'ID of the Tournament', required: true

    let(:organization) { create(:organization) }
    let(:organization_id) { organization.id }
    let(:org_tournament) { create(:tournament, organization:) }
    let(:id) { org_tournament.id }

    get('Show Tournament') do
      tags 'Tournaments'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Retrieves a specific Tournament.'
      operationId 'getTournament'

      response(200, 'successful') do
        schema '$ref' => TOURNAMENT_DETAILS_SCHEMA_COMPONENT
        OpenApi::Response.set_example_response_metadata
        run_test!
      end

      response(404, NOT_FOUND) do
        let(:id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end

    put('Update Tournament') do
      tags 'Tournaments'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      consumes OpenApi::Response::JSON_CONTENT_TYPE
      description 'Updates a Tournament.'
      operationId 'putTournament'

      parameter name: :tournament, in: :body, schema: { '$ref' => '#/components/schemas/TournamentDetails' }

      response(200, 'successful') do
        let(:game) { create(:game) }
        let(:format) { create(:format, game:) }
        let(:tournament) do
          {
            name: 'new_tournament',
            game_id: game.id,
            format_id: format.id
          }
        end

        schema '$ref' => TOURNAMENT_DETAILS_SCHEMA_COMPONENT

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end

    delete('Delete Tournament') do
      tags 'Tournaments'
      produces OpenApi::Response::JSON_CONTENT_TYPE
      description 'Deletes a Tournament.'
      operationId 'deleteTournament'

      response(200, 'successful') do
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
