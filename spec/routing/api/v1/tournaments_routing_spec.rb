require "rails_helper"

RSpec.describe Api::V1::TournamentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/api/v1/tournaments").to route_to("api/v1/tournaments#index", format: :json)
    end

    it "routes to #show" do
      expect(:get => "/api/v1/tournaments/1").to route_to("api/v1/tournaments#show", :id => "1", format: :json)
    end


    it "routes to #create" do
      expect(:post => "/api/v1/tournaments").to route_to("api/v1/tournaments#create", format: :json)
    end

    it "routes to #update via PUT" do
      expect(:put => "/api/v1/tournaments/1").to route_to("api/v1/tournaments#update", :id => "1", format: :json)
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/api/v1/tournaments/1").to route_to("api/v1/tournaments#update", :id => "1", format: :json)
    end

    it "routes to #destroy" do
      expect(:delete => "/api/v1/tournaments/1").to route_to("api/v1/tournaments#destroy", :id => "1", format: :json)
    end
  end
end
