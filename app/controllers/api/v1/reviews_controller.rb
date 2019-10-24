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

  def destroy
    Review.find(params[:id]).destroy
    render json: { message:
      {
        messageText: "Review deleted",
        refresh: true
      }
    }
  end

  def update
    edited_review = Review.find(params["id"])
    if edited_review.user == current_user
      if edited_review.update(review_params)
        render json: edited_review
      else
        render json: edited_review.errors
      end
    else
      render json: {user: "You are not permitted to edit this review."}
    end
  end

  private
  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end
