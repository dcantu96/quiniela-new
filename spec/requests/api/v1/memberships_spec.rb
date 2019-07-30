require 'rails_helper'

# RSpec.describe Api::V1::MembershipsController, type: :request do
#   describe "GET api/v1/memberships" do
#     it "works! (now write some real specs)" do
#       get memberships_path
#       expect(response).to have_http_status(200)
#     end
#   end
# end

RSpec.describe Api::V1::MembershipsController do
  describe "GET /memberships" do
    it "works! (now write some real specs)" do
      get '/api/v1/memberships'
      expect(response).to have_http_status(200)
    end
  end
end
