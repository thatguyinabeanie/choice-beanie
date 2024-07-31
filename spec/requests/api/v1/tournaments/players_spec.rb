require 'swagger_helper'
require_relative '../../../../support/openapi/schema_helper'
require_relative '../../../../support/openapi/response_helper'

RSpec.describe 'api/v1/tournaments/:tournament_id/players' do
  path('/api/v1/tournaments/{tournament_id}/players') do
    parameter name: :tournament_id, in: :path, type: :integer, description: 'ID of the tournament'

    get('List Players') do
      tags 'Players'
      produces 'application/json'
      description 'Retrieves a list of all Players'
      operationId 'listPlayers'

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }

        let(:tournament_id) { tournament.id }
        let(:players) { create_list(:player, 10, tournament:) }

        schema type: :array, items: { '$ref' => '#/components/schemas/Player' }

        run_test!
      end

      response(404, 'not found') do
        let(:tournament_id) { 'invalid' }

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end

    post('Create Player') do
      tags 'Players'
      produces 'application/json'
      consumes 'application/json'
      description 'Creates a new Player.'
      operationId 'postPlayer'

      parameter name: :player, in: :body, schema: {
        type: :object,
        properties: {
          player: {
            type: :object,
            title: 'postPlayer',
            properties: {
              user_id: { type: :integer },
              team_sheet_submitted: { type: :boolean },
              tournament_id: { type: :integer }
            },
            required: %w[user_id team_sheet_submitted tournament_id]
          }
        }
      }

      response(201, 'created') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:player) do
          {
            player: {
              user_id: create(:user).id,
              team_sheet_submitted: false,
              tournament_id: tournament.id
            }
          }
        end

        schema '$ref' => '#/components/schemas/PlayerDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!
      end

      response(404, 'not found') do
        let(:tournament_id) { 'invalid' }
        let(:player) do
          {
            player: {
              user_id: create(:user).id
            }
          }
        end

        OpenApi::Response.set_example_response_metadata
        run_test!
      end
    end
  end

  path('/api/v1/tournaments/{tournament_id}/players/{id}') do
    get('Show Player') do
      tags 'Players'
      produces 'application/json'
      description 'Retrieves a Player'
      operationId 'showPlayer'

      parameter name: :id, in: :path, type: :integer
      parameter name: :tournament_id, in: :path, type: :integer

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:player) { create(:player, tournament:) }
        let(:id) { player.user_id }

        schema '$ref' => '#/components/schemas/PlayerDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    put('Update Player') do
      tags 'Players'
      produces 'application/json'
      consumes 'application/json'
      description 'Updates a Player.'
      operationId 'putPlayer'

      parameter name: :id, in: :path, type: :integer
      parameter name: :tournament_id, in: :path, type: :integer
      parameter name: :player, in: :body, schema: {
        type: :object,
        properties: {
          player: {
            type: :object,
            title: 'putPlayer',
            properties: {
              team_sheet_submitted: { type: :boolean }
            },
            required: %w[user_id team_sheet_submitted tournament_id]
          }
        }
      }

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:tournament_player) { create(:player, tournament:) }
        let(:id) { tournament_player.user_id }
        let(:player) do
          {
            player: {
              user_id: tournament_player.user_id,
              tournament_id: tournament.id,
              checked_in_at: Time.current.utc
            }
          }
        end

        schema '$ref' => '#/components/schemas/PlayerDetails'
        OpenApi::Response.set_example_response_metadata

        run_test!
      end
    end

    delete('Delete Player') do
      tags 'Players'
      produces 'application/json'
      description 'Deletes a Player.'
      operationId 'deletePlayer'

      parameter name: :id, in: :path, type: :integer
      parameter name: :tournament_id, in: :path, type: :integer

      response(200, 'successful') do
        let(:tournament) { create(:tournament) }
        let(:tournament_id) { tournament.id }
        let(:player) { create(:player, tournament:) }
        let(:id) { player.user_id }

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
