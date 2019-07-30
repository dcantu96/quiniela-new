require 'rails_helper'

RSpec.describe "Tournaments", type: :request do
  describe "GET /tournaments" do
    it "works! (now write some real specs)" do
      get '/api/v1/tournaments'
      expect(response).to have_http_status(200)
    end
  end
end
