require 'rails_helper'

RSpec.describe Api::V1::UsersController do
  include Devise::Test::ControllerHelpers
  def json_response
    JSON.parse(response.body, symbolize_names: true)
  end

  describe 'GET /index' do
    it 'returns a successful response' do
      create_list(:user, 3)

      get :index

      expect(response).to be_successful
    end

    it 'returns a list of users' do
      create_list(:user, 3)

      get :index

      expect(json_response.size).to eq(3)
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(response).to be_successful
    end

    it 'returns the user' do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(json_response[:id]).to eq(user.id)
    end
  end

  describe 'POST /create' do
    it 'returns a successful response' do
      post :create, params: { user: attributes_for(:user) }

      expect(response).to be_successful
    end

    it 'creates a new user' do
      user_attributes = attributes_for(:user)

      post :create, params: { user: user_attributes }

      expect(json_response[:email]).to eq(user_attributes[:email])
    end
  end

  describe 'PUT /update' do
    it 'returns a successful response' do
      user = create(:user)
      user_attributes = attributes_for(:user)

      put :update, params: { id: user.id, user: user_attributes }

      expect(response).to be_successful
    end

    it 'updates the user' do
      user = create(:user)

      put :update, params: { id: user.id, user: { first_name: 'Jane' } }

      expect(json_response[:first_name]).to eq('Jane')
    end
  end

  describe 'PATCH /update' do
    it 'returns a successful response' do
      user = create(:user)

      patch :update, params: { id: user.id, user: { first_name: 'Jane' } }

      expect(response).to be_successful
    end

    it 'updates the user' do
      user = create(:user)

      patch :update, params: { id: user.id, user: { first_name: 'Jane' } }

      expect(json_response[:first_name]).to eq('Jane')
    end
  end

  describe 'DELETE /destroy' do
    it 'returns a successful response' do
      user = create(:user)

      delete :destroy, params: { id: user.id }

      expect(response).to be_successful
    end

    it 'deletes the user' do
      user = create(:user)

      delete :destroy, params: { id: user.id }

      expect(User.find_by(id: user.id)).to be_nil
    end
  end
end
