require "rails_helper"

RSpec.describe Api::V1::BreweriesController, type: :controller do
  describe "GET#index" do
    it "should return a list of all of the Breweries" do
      FactoryBot.create(:brewery)
      FactoryBot.create(:brewery)
      FactoryBot.create(:brewery)
      FactoryBot.create(:brewery)
      FactoryBot.create(:brewery)
      brewery = FactoryBot.create(:brewery, name: "Test Brews")

      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 6
      expect(returned_json).to be_kind_of(Array)

      expect(returned_json[5]["name"]).to eq brewery.name
      expect(returned_json[5]["city"]).to eq brewery.city
      expect(returned_json[5]["state"]).to eq brewery.state
      expect(returned_json[5]["id"]).to eq brewery.id
    end
  end
end
