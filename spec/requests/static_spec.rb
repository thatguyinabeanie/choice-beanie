require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/static/index"
      expect(response).to have_http_status(:success)
    end
  end

end
