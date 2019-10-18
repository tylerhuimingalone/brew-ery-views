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

  describe "POST#create" do
    it "should return a newly created brewery when filled out correctly" do
      current_count = Brewery.count
      test_brewery = { brewery: {
        name: "Test Brew",
        address: "123 Example Street",
        city: "Boston",
        state: "MA",
        zip: "02111"
      } }

      post :create, params: test_brewery, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["name"]).to eq test_brewery[:brewery][:name]
      expect(returned_json["address"]).to eq test_brewery[:brewery][:address]
      expect(Brewery.count).to eq(current_count + 1)
    end

    it "should return errors when filled out incorrectly" do
      current_count = Brewery.count
      blank_brewery = { brewery: {
        name: "",
        address: "",
        city: "",
        state: "MA",
        zip: "02111"
      } }

      post :create, params: blank_brewery, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["name"]).to eq ["can't be blank"]
      expect(returned_json["address"]).to eq ["can't be blank"]
      expect(returned_json["city"]).to eq ["can't be blank"]
      expect(Brewery.count).to eq(current_count)
    end
  end
end
