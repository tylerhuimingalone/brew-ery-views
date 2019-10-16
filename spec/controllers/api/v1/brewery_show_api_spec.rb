require "rails_helper"

RSpec.describe Api::V1::BreweriesController, type: :controller do
  describe "GET#show" do
    it "should return an individual brewery's information hash" do
      night_shift = Brewery.create(
        name: "Night Shift Brewing",
        address: "1 Lovejoy Wharf Suit 101",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )

      get :show, params: {id: night_shift.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)

      expect(returned_json["id"]).to eq night_shift.id
      expect(returned_json["name"]).to eq night_shift.name
      expect(returned_json["address"]).to eq night_shift.address
      expect(returned_json["city"]).to eq night_shift.city
      expect(returned_json["state"]).to eq night_shift.state
      expect(returned_json["zip"]).to eq night_shift.zip
    end
  end
end
