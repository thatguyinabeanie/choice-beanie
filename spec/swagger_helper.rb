# frozen_string_literal: true

require 'rails_helper'
require 'support/constants'

FORMAT_SCHEMA = {
  type: :object,
  title: 'Format',
  properties: {
    id: { type: :integer },
    name: { type: :string },
    slug: { type: :string }
  }
}.freeze

GAME_SCHEMA = {
  type: :object,
  title: 'Game',
  properties: {
    id: { type: :integer },
    name: { type: :string },
    slug: { type: :string }
  },
  required: %w[id name slug]
}.freeze

GAME_DETAILS_SCHEMA = {
  type: :object,
  title: 'GameDetail',
  properties: {
    id: { type: :integer },
    name: { type: :string },
    slug: { type: :string },
    formats: { type: :array, items: { '$ref' => '#/components/schemas/Format' } }
  },
  required: %w[id name slug formats]
}.freeze

USER_SCHEMA = {
  type: :object,
  title: 'User',
  properties: {
    id: { type: :integer },
    username: { type: :string },
    pronouns: { type: :string }
  },
  required: %w[id username pronouns]
}.freeze

USER_DETAILS_SCHEMA = {
  type: :object,
  title: 'UserDetails',
  properties: {
    id: { type: :integer },
    username: { type: :string },
    email: { type: :string },
    first_name: { type: :string },
    last_name: { type: :string },
    pronouns: { type: :string },
    slug: { type: :string }
  },
  required: %w[id username email first_name last_name pronouns slug]
}.freeze

ORGANIZATION_SCHEMA = {
  type: :object,
  title: 'Organization',
  properties: {
    id: { type: :integer },
    name: { type: :string },
    owner: { '$ref' => '#/components/schemas/User' }
  },
  required: %w[id name owner]
}.freeze

ORGANIZATION_DETAILS_SCHEMA = {
  type: :object,
  title: 'OrganizationDetails',

  properties: {
    id: { type: :integer },
    name: { type: :string },
    owner: { '$ref' => '#/components/schemas/UserDetails' },
    description: { type: :string },
    slug: { type: :string },
    updated_at: { type: :string, format: DATE_TIME_TYPE },
    created_at: { type: :string, format: DATE_TIME_TYPE }
  },
  required: %w[id name owner description slug created_at updated_at]
}.freeze

TOURNAMENT_SCHEMA = {
  type: :object,
  title: 'Tournament',
  properties: {
    id: { type: :integer },
    name: { type: :string },
    slug: { type: :string },

    organization: { '$ref' => '#/components/schemas/Organization' },

    format: { '$ref' => '#/components/schemas/Format' },
    game: { '$ref' => '#/components/schemas/Game' },

    player_cap: { type: :integer, nullable: true },

    autostart: { type: :boolean },
    start_at: { type: :string, format: DATE_TIME_TYPE },
    end_at: { type: :string, format: DATE_TIME_TYPE },
    started_at: { type: :string, format: DATE_TIME_TYPE },
    ended_at: { type: :string, format: DATE_TIME_TYPE },

    check_in_required: { type: :boolean },
    late_check_in: { type: :boolean },
    check_in_start_at: { type: :string, format: DATE_TIME_TYPE },

    late_registration: { type: :boolean },
    registration_start_at: { type: :string, format: DATE_TIME_TYPE },
    registration_end_at: { type: :string, format: DATE_TIME_TYPE },

    teamlists_required: { type: :boolean },
    open_team_sheets: { type: :boolean }
  },
  required: %w[id name organization format game start_at player_cap autostart check_in_required late_check_in check_in_start_at late_registration registration_start_at registration_end_at
               teamlists_required open_team_sheets]
}.freeze

TOURNAMENT_DETAILS_SCHEMA = {
  type: :object,
  title: 'TournamentDetails',
  properties: TOURNAMENT_SCHEMA[:properties],
  required: TOURNAMENT_SCHEMA[:required] + %w[]
}.freeze

POKEMON_SET_SCHEMA = {
  type: :object,
  title: 'PokemonSet',
  properties: {
    name: { type: :string },
    ability: { type: :string },
    tera_type: { type: :string },
    nature: { type: :string },
    held_item: { type: :string },
    move1: { type: :string },
    move2: { type: :string },
    move3: { type: :string },
    move4: { type: :string }
  },
  required: %w[name ability tera_type nature held_item move1 move2 move3 move4]
}.freeze

PLAYER_SCHEMA = {
  type: :object,
  title: 'Player',
  properties: {
    user: { '$ref' => '#/components/schemas/User' },
    checked_in: { type: :boolean },
    checked_in_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    team_sheet_submitted: { type: :boolean },
    team_sheet_submitted_at: { type: :string, format: DATE_TIME_TYPE, nullable: true }
  },
  required: %w[id user checked_in checked_in_at team_sheet_submitted team_sheet_submitted_at]
}.freeze

PLAYER_DETAILS_SCHEMA = {
  type: :object,
  title: 'PlayerDetails',
  properties: PLAYER_SCHEMA[:properties].merge(
    {
      pokemon_sets: { type: :array, items: { '$ref' => '#/components/schemas/PokemonSet' } }
    }
  )
}.freeze

RSpec.configure do |config|
  # config.include SwaggerHelper
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

  config.openapi_strict_schema_validation = true

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under openapi_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a openapi_spec tag to the
  # the root example_group in your specs, e.g. describe '...', openapi_spec: 'v2/swagger.json'
  config.openapi_specs = {
    'v1/openapi.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: '127.0.0.1'
            }
          }
        }
      ],
      components: {
        responses: {
          NotFound: {
            description: 'Not found'
          }
        },

        schemas: {
          Format: FORMAT_SCHEMA,
          Game: GAME_SCHEMA,
          GameDetail: GAME_DETAILS_SCHEMA,
          User: USER_SCHEMA,
          UserDetails: USER_DETAILS_SCHEMA,
          Organization: ORGANIZATION_SCHEMA,
          OrganizationDetails: ORGANIZATION_DETAILS_SCHEMA,
          Tournament: TOURNAMENT_SCHEMA,
          TournamentDetails: TOURNAMENT_DETAILS_SCHEMA,
          PokemonSet: POKEMON_SET_SCHEMA,
          Player: PLAYER_SCHEMA,
          PlayerDetails: PLAYER_DETAILS_SCHEMA
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The openapi_specs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.openapi_format = :yaml
end
