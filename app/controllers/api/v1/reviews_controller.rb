class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Review.where(brewery_id: params["brewery_id"])
  end

  def create
    new_review = Review.new(review_params)
    brewery = Brewery.find(params[:breweryId])
    new_review.brewery = brewery
    if new_review.save
      render json: new_review
    else
      render json: new_review.errors
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
