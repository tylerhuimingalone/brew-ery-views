class Api::V1::ReviewsController < ApplicationController
  def index
    render json: Review.where(brewery_id: params["brewery_id"])
  end
end
