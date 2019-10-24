require "rails_helper"

RSpec.describe Api::V1::BeersController, type: :controller do
  describe "GET#index" do
    it "should return a list of all of the beers" do
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      beer = Beer.create(
        name: "Dogsbottom IPA",
        beer_type: "IPA",
        description: "Better than one might think",
        brewery_id: brewery.id
      )

      get :index, params: { brewery_id: brewery.id }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 1
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["beers"][0]["name"]).to eq beer.name
      expect(returned_json["beers"][0]["beer_type"]).to eq beer.beer_type
      expect(returned_json["beers"][0]["description"]).to eq beer.description
    end
  end
end
