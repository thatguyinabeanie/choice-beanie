# frozen_string_literal: true

require 'rails_helper'

RSpec.configure do |config|
  # config.include SwaggerHelper
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.openapi_root = Rails.root.join('swagger').to_s

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
          User: {
            type: :object,
            title: 'User',
            properties: {
              id: { type: :integer },
              username: { type: :string },
              pronouns: { type: :string }
            },
            required: %w[id username pronouns]
          },

          UserDetails: {
            type: :object,
            title: 'UserDetails',
            allOf: [
              { '$ref' => '#/components/schemas/User' },
              {
                properties: {
                  email: { type: :string },
                  first_name: { type: :string },
                  last_name: { type: :string },
                  slug: { type: :string }
                }
              }
            ]
          },

          Game: {
            type: :object,
            title: 'Game',
            properties: {
              id: { type: :integer },
              name: { type: :string },
              slug: { type: :string }
            },
            required: %w[name slug]
          },

          Organization: {
            type: :object,
            title: 'Organization',
            properties: {
              id: { type: :integer },
              name: { type: :string },
              description: { type: :string },
              slug: { type: :string },
              owner: { '$ref' => '#/components/schemas/User' }
            },
            required: %w[name]
          }
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
