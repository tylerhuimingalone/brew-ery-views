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

      expect(returned_json["brewery"]["id"]).to eq night_shift.id
      expect(returned_json["brewery"]["name"]).to eq night_shift.name
      expect(returned_json["brewery"]["address"]).to eq night_shift.address
      expect(returned_json["brewery"]["city"]).to eq night_shift.city
      expect(returned_json["brewery"]["state"]).to eq night_shift.state
      expect(returned_json["brewery"]["zip"]).to eq night_shift.zip
    end

    it "should return 'No reviews' for average score if not reviewed" do
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

      expect(returned_json["average"]).to eq("No reviews")
    end

    it "should return average score for the brewery" do
      night_shift = Brewery.create(
        name: "Night Shift Brewing",
        address: "1 Lovejoy Wharf Suit 101",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      FactoryBot.create(:user)
      FactoryBot.create(:review)
      FactoryBot.create(:review, rating: 5)

      get :show, params: {id: night_shift.id}
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json).to be_kind_of(Hash)

      expect(returned_json["average"]).to eq 4
    end
  end
end
