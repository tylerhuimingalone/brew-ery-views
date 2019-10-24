require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "GET#index" do
    it "should return a list of all of the Reviews" do
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      user = User.create(
        username: 'username',
        email: "user@example.com",
        password: 'password',
        password_confirmation: 'password'
      )
      review = Review.create(
        rating: 5,
        comment: "Text",
        brewery_id: brewery.id,
        user_id: user.id
      )

      get :index, params: { brewery_id: brewery.id }

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json.length).to eq 2
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json["reviews"][0]["rating"]).to eq review.rating
      expect(returned_json["reviews"][0]["comment"]).to eq review.comment
    end
  end

  describe "POST#create" do
    it "should return a newly created review when filled out correctly" do
      user = FactoryBot.create(:user)
      sign_in user
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = {
        review: {
          rating: 5,
          comment: "Hello this is a comment"
        },
        breweryId: brewery.id
      }
      current_count = Review.count

      post :create, params: test_review, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["rating"]).to eq test_review[:review][:rating]
      expect(returned_json["comment"]).to eq test_review[:review][:comment]
      expect(Review.count).to eq(current_count + 1)
    end

    it "should return errors when filled out incorrectly" do
      user = FactoryBot.create(:user)
      sign_in user
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      blank_review = {
        review: {
          rating: "",
          comment: "Hello this is a comment"
        },
        breweryId: brewery.id
      }
      current_count = Review.count

      post :create, params: blank_review, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["rating"]).to eq ["is not a number"]
      expect(Review.count).to eq(current_count)
    end

    it "should return a user error if not signed in" do
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = {
        review: {
          rating: 5,
          comment: "Hello this is a comment"
        },
        breweryId: brewery.id
      }
      current_count = Review.count

      post :create, :params =>  test_review, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)
      expect(returned_json["user"]).to eq("You must be signed in to add a review.")
      expect(Review.count).to eq(current_count)
    end
  end

  describe "DELETE#destroy" do
    it "should delete a saved review" do
      user = FactoryBot.create(:user)
      sign_in user
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = Review.create(
        rating: 4,
        comment: "Test Review",
        brewery: brewery,
        user: user
      )
      id = test_review.id
      current_count = Review.count

      delete :destroy, params: { id: id }, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)

      expect(returned_json["message"]["messageText"]).to eq("Review deleted")
      expect(Review.count).to eq(current_count - 1)
    end
  end

  describe "PATCH#update" do
    it "should update a saved review" do
      user = FactoryBot.create(:user)
      sign_in user
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = Review.create(
        rating: 4,
        comment: "Test Review",
        brewery: brewery,
        user: user
      )
      current_count = Review.count

      patch :update, params: { id: test_review["id"], review: { rating: 5, comment: "New comment" } }, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)

      expect(returned_json["rating"]).to eq 5
      expect(returned_json["comment"]).to eq("New comment")

      expect(Review.count).to eq(current_count)
    end

    it "should not update if the rating is blank"do
      user = FactoryBot.create(:user)
      sign_in user
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = Review.create(
        rating: 4,
        comment: "Test Review",
        brewery: brewery,
        user: user
      )
      current_count = Review.count

      patch :update, params: { id: test_review["id"], review: { rating: "", comment: "New comment" } }, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)

      expect(returned_json["rating"]).to eq(["is not a number"])
      expect(Review.count).to eq(current_count)
    end

    it "should not update if the user is not the current user"do
      user = FactoryBot.create(:user)
      brewery = Brewery.create(
        name: "BEERWORKS (No. 3 Boston/Canal)",
        address: "112 Canal St.",
        city: "Boston",
        state: "MA",
        zip: "02114",
        image: ""
      )
      test_review = Review.create(
        rating: 4,
        comment: "Test Review",
        brewery: brewery,
        user: user
      )
      current_count = Review.count

      patch :update, params: { id: test_review["id"], review: { rating: 5, comment: "New comment" } }, format: :json

      returned_json = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")
      expect(returned_json).to be_kind_of(Hash)
      expect(returned_json).to_not be_kind_of(Array)

      expect(returned_json["user"]).to eq("You are not permitted to edit this review.")
      expect(Review.count).to eq(current_count)
    end
  end
end
