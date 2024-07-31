require 'swagger_helper'

RSpec.describe 'api/v1/matches', type: :request do
  path('/api/v1/matches') do
    get('List Matches') do
    end

    post('Create Match') do
    end
  end

  path('/api/v1/matches/{id}') do
  end
end
