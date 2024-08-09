# frozen_string_literal: true

require 'rails_helper'
require 'support/constants'

ID_PROPERTY = { id: { type: :integer } }.freeze
NAME_PROPERTY = { name: { type: :string } }.freeze
ID_NAME_REQUIRED = %w[id name].freeze
PASSWORD_STRING_TYPE = { type: :string, minLength: 8, format: 'password' }.freeze

ID_NAME_PROPERTIES = {
  id: ID_PROPERTY[:id],
  name: NAME_PROPERTY[:name]
}.freeze

FORMAT_SCHEMA = {
  type: :object,
  title: 'Format',
  properties: ID_NAME_PROPERTIES
}.freeze

GAME_SCHEMA = {
  type: :object,
  title: 'Game',
  properties: ID_NAME_PROPERTIES,
  required: ID_NAME_REQUIRED
}.freeze

GAME_REQUEST = {
  type: :object,
  title: 'GameRequest',
  properties: ID_NAME_PROPERTIES,
  required: %w[name]
}.freeze

GAME_DETAILS_SCHEMA = {
  type: :object,
  title: 'Game Details',
  properties: GAME_SCHEMA[:properties].merge(
    formats: { type: :array, items: { '$ref' => '#/components/schemas/Format' } }
  ),
  required: (GAME_SCHEMA[:required] + %w[formats])
}.freeze

PASSWORD_REQUEST = {
  type: :object,
  title: 'Password Request',
  properties: {
    password: PASSWORD_STRING_TYPE.merge(title: 'Password', description: 'Must be at least 8 characters'),
    password_confirmation: PASSWORD_STRING_TYPE.merge(title: 'Password Confirmation', description: 'Must match the password.')
  },
  required: %w[password password_confirmation]
}.freeze

CHANGE_PASSWORD_REQUEST = {
  allOf: [
    { '$ref' => '#/components/schemas/PasswordRequest' },
    {
      title: 'Change Password Request',
      properties: {
        current_password: PASSWORD_STRING_TYPE.merge(title: 'Current Password', description: 'Your current password.')
      },
      required: %w[current_password]
    }
  ]
}.freeze

SIMPLE_USER_SCHEMA = {
  type: :object,
  title: 'Simple User',
  properties: {
    username: { type: :string },
    pronouns: { type: :string }
  },
  required: %w[username pronouns]
}.freeze

USER_SCHEMA = SIMPLE_USER_SCHEMA.deep_merge(
  {
    title: 'User',
    properties: ID_PROPERTY,
    required: %w[username pronouns id] + SIMPLE_USER_SCHEMA[:required]
  }
)

SIMPLE_USER_DETAILS_SCHEMA = SIMPLE_USER_SCHEMA.deep_merge(
  {
    type: :object,
    title: 'Simple User Details',
    properties: {
      email: { type: :string },
      first_name: { type: :string },
      last_name: { type: :string }
    },
    required: %w[email first_name last_name] + SIMPLE_USER_SCHEMA[:required]
  }
).freeze

USER_DETAILS_SCHEMA = SIMPLE_USER_DETAILS_SCHEMA.deep_merge(
  {
    type: :object,
    title: 'User Details',
    properties: ID_PROPERTY,
    required: %w[id] + SIMPLE_USER_DETAILS_SCHEMA[:required]
  }
).freeze

USER_REQUEST = SIMPLE_USER_DETAILS_SCHEMA.deep_merge(
  {
    type: :object,
    title: 'User Request',
    properties: ID_PROPERTY.merge(
      current_password: PASSWORD_STRING_TYPE.merge(title: 'Current Password', description: 'Your current password.')
    ),
    required: %w[current_password] + SIMPLE_USER_DETAILS_SCHEMA[:required]
  }
).freeze

USER_POST_REQUEST = SIMPLE_USER_DETAILS_SCHEMA.deep_merge(
  {
    type: :object,
    title: 'User Request',
    properties: ID_PROPERTY.merge(
      password: PASSWORD_STRING_TYPE.merge(title: 'Password', description: 'Must be at least 8 characters'),
      password_confirmation: PASSWORD_STRING_TYPE.merge(title: 'Password Confirmation', description: 'Must match the password.')
    ),
    required: %w[password password_confirmation] + SIMPLE_USER_DETAILS_SCHEMA[:required]
  }
).freeze

ORGANIZATION_SCHEMA = {
  type: :object,
  title: 'Organization',
  properties: ID_NAME_PROPERTIES.merge(
    owner: { '$ref' => '#/components/schemas/User' },
    description: { type: :string, nullable: true }
  ),
  required: ID_NAME_REQUIRED + %w[owner description]
}.freeze

ORGANIZATION_DETAILS_SCHEMA = {
  type: :object,
  title: 'Organization Details',

  properties: ORGANIZATION_SCHEMA[:properties],
  required: ORGANIZATION_SCHEMA[:required]
}.freeze


TOURNAMENT_PROPERTIES = {
  player_cap: { type: :integer, nullable: true },
    player_count: { type: :integer },
    end_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    started_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    ended_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    registration_start_at: { type: :string, format: DATE_TIME_TYPE },
    registration_end_at: { type: :string, format: DATE_TIME_TYPE },
    late_registration: { type: :boolean },

}

TOURNAMENT_SCHEMA = {
  type: :object,
  title: 'Tournament',
  properties: ID_NAME_PROPERTIES.merge(
    start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    organization: { '$ref' => '#/components/schemas/Organization' },
    format: { '$ref' => '#/components/schemas/Format' },
    game: { '$ref' => '#/components/schemas/Game' }

  ).merge(TOURNAMENT_PROPERTIES),
  required: ID_NAME_REQUIRED + %w[player_cap organization format game start_at player_count registration_start_at registration_end_at late_registration]
}.freeze


TOURNAMENT_DETAILS_SCHEMA = {
  type: :object,
  title: 'Tournament Details',
  properties: ID_NAME_PROPERTIES.merge(TOURNAMENT_PROPERTIES).merge(
    autostart: { type: :boolean },
    start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    end_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    organization: { '$ref' => '#/components/schemas/Organization' },
    format: { '$ref' => '#/components/schemas/Format' },
    game: { '$ref' => '#/components/schemas/Game' }
    late_check_in: { type: :boolean },
    check_in_start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    late_registration: { type: :boolean },
    teamlists_required: { type: :boolean },
    open_team_sheets: { type: :boolean }
  ),
  required: TOURNAMENT_SCHEMA[:required] + %w[
    start_at player_cap autostart
    teamlists_required open_team_sheets
    late_check_in check_in_start_at
    late_registration registration_start_at registration_end_at
  ]
}.freeze

TOURNAMENT_REQUEST = {
  type: :object,
  title: 'Tournament Request',
  properties: ID_NAME_PROPERTIES.merge({
    game_id: { type: :integer },
    format_id: { type: :integer },
    autostart: { type: :boolean },
    start_at: { type: :string, format: DATE_TIME_TYPE },
    player_cap: { type: :integer, nullable: true },
    registration_start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    registration_end_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    late_registration: { type: :boolean },
    late_check_in: { type: :boolean },
    check_in_start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    open_team_sheets: { type: :boolean },
    teamlists_required: { type: :boolean }
  }),
  required: %w[name game_id format_id autostart start_at player_cap registration_start_at registration_end_at late_registration late_check_in check_in_start_at open_team_sheets teamlists_required]
}

TOURNAMENT_POST_REQUEST = {
  type: :object,
  title: 'Tournament Post Request',
  properties: {
    organization_id: { type: :integer },
    name: { type: :string },
    game_id: { type: :integer },
    format_id: { type: :integer },
    autostart: { type: :boolean },
    start_at: { type: :string, format: DATE_TIME_TYPE },
    player_cap: { type: :integer, nullable: true },
    registration_start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    registration_end_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    late_registration: { type: :boolean },
    late_check_in: { type: :boolean },
    check_in_start_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    open_team_sheets: { type: :boolean },
    teamlists_required: { type: :boolean }
  },
  required: %w[organization_id name game_id format_id autostart player_cap registration_start_at registration_end_at late_registration late_check_in check_in_start_at open_team_sheets teamlists_required]
}


POKEMON_SCHEMA = {
  type: :object,
  title: 'Pokemon',
  properties: ID_NAME_PROPERTIES.merge(
    nickname: { type: :string, nullable: true },
    ability: { type: :string },
    tera_type: { type: :string },
    nature: { type: :string },
    held_item: { type: :string, nullable: true },
    move1: { type: :string, nullable: true },
    move2: { type: :string, nullable: true },
    move3: { type: :string, nullable: true },
    move4: { type: :string, nullable: true }
  ),
  required: ID_NAME_REQUIRED + %w[ability tera_type nature held_item move1 move2 move3 move4]
}.freeze

PLAYER_REQUEST = {
  type: :object,
  title: 'Player Request',
  properties: {
    user_id: { type: :integer },
    in_game_name: { type: :string }
  },
  required: %w[user_id in_game_name]
}.freeze

PLAYER_SCHEMA = {
  type: :object,
  title: 'Player',
  properties: {
    id: { type: :integer },
    user: { '$ref' => '#/components/schemas/User' },
    in_game_name: { type: :string }
    # checked_in: { type: :boolean },
    # checked_in_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    # team_sheet_submitted: { type: :boolean },
    # team_sheet_submitted_at: { type: :string, format: DATE_TIME_TYPE, nullable: true }
  },
  # required: %w[id user in_game_name checked_in checked_in_at team_sheet_submitted team_sheet_submitted_at]
  required: %w[id user in_game_name]
}.freeze

PLAYER_DETAILS_SCHEMA = {
  type: :object,
  title: 'Player Details',
  properties: PLAYER_SCHEMA[:properties].merge(
    {
      # pokemon: { type: :array, items: { '$ref' => '#/components/schemas/Pokemon' } }
      #
    }
  ),
  # required: PLAYER_SCHEMA[:required] + %w[pokemon]
  required: PLAYER_SCHEMA[:required]
}.freeze

ROUND_SCHEMA = {
  type: :object,
  title: 'Round',
  properties: ID_PROPERTY.merge(
    phase_id: { type: :integer },
    round_number: { type: :integer },
    started_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    ended_at: { type: :string, format: DATE_TIME_TYPE, nullable: true }
  ),
  required: %w[id phase_id round_number started_at ended_at]
}.freeze

PHASE_SCHEMA = {
  type: :object,
  title: 'Phase',
  properties: ID_NAME_PROPERTIES.merge(
    order: { type: :integer },
    type: { type: :string },
    tournament_id: { type: :integer },
    number_of_rounds: { type: :integer },
    best_of: { type: :integer },
    criteria: { type: :string, nullable: true },
    started_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    ended_at: { type: :string, format: DATE_TIME_TYPE, nullable: true },
    created_at: { type: :string, format: DATE_TIME_TYPE },
    updated_at: { type: :string, format: DATE_TIME_TYPE }
  ),
  required: ID_NAME_REQUIRED + %w[order tournament_id number_of_rounds best_of criteria started_at ended_at]
}.freeze

PHASE_DETAILS_SCHEMA = {
  type: :object,
  title: 'Phase Details',
  properties: PHASE_SCHEMA[:properties].merge(
    players: { type: :array, items: { '$ref' => '#/components/schemas/Player' } },
    rounds: { type: :array, items: { '$ref' => '#/components/schemas/Round' } }
  ),
  required: PHASE_SCHEMA[:required] + %w[players rounds]
}.freeze

USER_LOGIN_REQUEST = {
  type: :object,
  title: 'User Login Request',
  properties: {

    email: { type: :string, format: 'email' },
    password: PASSWORD_STRING_TYPE.merge(title: 'Password', description: 'Must be at least 8 characters')
  },
  required: %w[email password]
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
            description: NOT_FOUND
          }
        },

        schemas: {
          Format: FORMAT_SCHEMA,
          Game: GAME_SCHEMA,
          GameDetail: GAME_DETAILS_SCHEMA,
          PasswordRequest: PASSWORD_REQUEST,
          ChangePasswordRequest: CHANGE_PASSWORD_REQUEST,
          User: USER_SCHEMA,
          UserDetails: USER_DETAILS_SCHEMA,
          UserPostRequest: USER_POST_REQUEST,
          UserRequest: USER_REQUEST,
          Organization: ORGANIZATION_SCHEMA,
          OrganizationDetails: ORGANIZATION_DETAILS_SCHEMA,
          Tournament: TOURNAMENT_SCHEMA,
          TournamentDetails: TOURNAMENT_DETAILS_SCHEMA,
          Pokemon: POKEMON_SCHEMA,
          PlayerRequest: PLAYER_REQUEST,
          Player: PLAYER_SCHEMA,
          PlayerDetails: PLAYER_DETAILS_SCHEMA,
          Round: ROUND_SCHEMA,
          Phase: PHASE_SCHEMA,
          PhaseDetails: PHASE_DETAILS_SCHEMA,
          GameRequest: GAME_REQUEST,
          UserLoginRequest: USER_LOGIN_REQUEST,
          TournamentRequest: TOURNAMENT_REQUEST,
          TournamentPostRequest: TOURNAMENT_POST_REQUEST
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
