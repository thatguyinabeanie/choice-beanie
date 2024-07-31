require 'swagger_helper'
require_relative '../../../support/openapi/schema_helper'
require_relative '../../../support/openapi/response_helper'

TOURNAMENT_DETAILS_SCHEMA_COMPONENT = '#/components/schemas/TournamentDetails'.freeze
RSpec.describe 'api/v1/organizations/:organization_id/tournaments' do
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

      parameter name: :tournament, in: :body, schema: {
        type: :object,
        title: 'postTournament',
        properties: {
          name: { type: :string },
          start_at: { type: :string, format: DATE_TIME_TYPE },
          end_at: { type: :string, format: DATE_TIME_TYPE },
          game_id: { type: :integer },
          format_id: { type: :integer },
          auto_start: { type: :boolean },
          player_cap: { type: :integer },
          registration_start_at: { type: :string, format: DATE_TIME_TYPE },
          registration_end_at: { type: :string, format: DATE_TIME_TYPE },
          late_registration: { type: :boolean },
          check_in_required: { type: :boolean },
          late_check_in: { type: :boolean },
          check_in_start_at: { type: :string, format: DATE_TIME_TYPE },
          check_in_end_at: { type: :string, format: DATE_TIME_TYPE },
          open_team_sheets: { type: :boolean },
          teamlists_required: { type: :boolean }
        },
        required: %w[name game_id format_id]
      }

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
end
