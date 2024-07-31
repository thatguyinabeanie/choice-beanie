require 'rails_helper'

RSpec.describe 'Tournaments API', type: :request do
  pending "add some examples to (or delete) #{__FILE__}" do
    let(:user) { create(:user) }
    let(:tournament) { create(:tournament) }

    # before do
    #   sign_in user
    # end

    def json
      JSON.parse(response.body)
    end

    describe 'GET /api/v1/tournaments' do
      let(:organization) { create(:organization) }

      it 'returns http status :success' do
        (1..10).each { |n| create(:tournament, start_at: n.weeks.from_now) }
        get "/api/v1/organizations/#{organization.id}/tournaments"
        expect(response).to have_http_status(:success)
      end

      it 'returns a list of tournaments' do
        (1..10).each { |n| create(:tournament, start_at: n.weeks.from_now) }
        get '/api/v1/tournaments'
        expect(json.size).to eq(10)
      end
    end

    describe 'GET /api/v1/tournaments/:id' do
      it 'returns a tournament' do
        get "/api/v1/tournaments/#{tournament.id}"

        expect(response).to have_http_status(:success)
        expect(json['id'].to_i).to eq(tournament.id)
      end

      it 'returns a tournament' do
        get "/api/v1/tournaments/#{tournament.id}"

        expect(response).to have_http_status(:success)
        expect(json['id'].to_i).to eq(tournament.id)
      end
    end

    describe 'POST /api/v1/tournaments' do
      it 'creates a tournament' do
        post '/api/v1/tournaments', params: { tournament: { name: 'New Tournament' } }

        expect(response).to have_http_status(:created)
        expect(json['attributes']['name']).to eq('New Tournament')
      end
    end

    describe 'PUT /api/v1/tournaments/:id' do
      it 'updates a tournament' do
        put "/api/v1/tournaments/#{tournament.id}", params: { tournament: { name: 'Updated Tournament' } }

        expect(response).to have_http_status(:success)
        expect(json['attributes']['name']).to eq('Updated Tournament')
      end
    end

    describe 'DELETE /api/v1/tournaments/:id' do
      it 'deletes a tournament' do
        delete "/api/v1/tournaments/#{tournament.id}"

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
