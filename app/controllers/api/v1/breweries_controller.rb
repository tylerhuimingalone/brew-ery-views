class Api::V1::BreweriesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: { breweries: Brewery.all, user: user_signed_in? }
  end

  def show
    average = average_score(params["id"])
    render json: {brewery: Brewery.find(params["id"]), average: average}
  end

  def create
    if user_signed_in?
      new_brewery = Brewery.new(brewery_params)

      if new_brewery.save
        render json: new_brewery
      else
        render json: new_brewery.errors
      end
    else
      render json: {user: "You must be signed in to add a brewery."}
    end
  end

  private

  def average_score(brewery_id)
    brewery = Brewery.find(brewery_id)
    score_total = 0
    review_list = brewery.reviews
    review_list.each do |review|
      score_total += review.rating
    end
    if review_list.length == 0
      return "No reviews"
    end
    score_total / review_list.length
  end

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip, :image)
  end
end
