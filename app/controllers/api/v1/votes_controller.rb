class Api::V1::VotesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def update_review_votes (review_id, vote_value)
    current_review = Review.find(review_id)
    total = 0
    current_review.votes.each do |vote|
      total = total + vote.vote
    end
    current_review.update(total: total)
  end

  def create
    if user_signed_in?
      user_id = current_user.id

      if (Vote.find_by(review_id: params["review_id"], user_id: user_id) === nil)
        vote = Vote.new(vote_params)
        vote.user_id = user_id
        vote.review_id = params["review_id"]
        vote.save
        update_review_votes(params["review_id"], vote[:vote])
        render json: Review.find(params["review_id"])
      else
        vote_to_update = Vote.find_by(review_id: params["review_id"], user_id: user_id)
        if vote_to_update[:vote] != params["vote"]["vote"]
          vote_to_update.update(vote_params)
        else
          vote_to_update.update(vote: 0)
        end
        update_review_votes(params["review_id"], vote_to_update[:vote])
        render json: Review.find(params["review_id"])
      end
    else
      render json: { user: "You must be logged in to vote for reviews"}
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:vote)
  end
end
