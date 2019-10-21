class Api::V1::ReviewsController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    brewery = Brewery.find(params["brewery_id"])
    user_id = 0
    if current_user
      user_id = current_user.id
    end
    render json: { reviews: brewery.reviews, user_id: user_id }
  end

  def create
    if user_signed_in?
      new_review = Review.new(review_params)
      brewery = Brewery.find(params[:breweryId])
      new_review.brewery = brewery
      new_review.user = current_user
      if new_review.save
        render json: new_review
      else
        render json: new_review.errors
      end
    else
      render json: {user: "You must be signed in to add a review."}
    end
  end

  def delete
    Review.find(params[:id]).destroy
    render json: { message: "Review Deleted" }
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
