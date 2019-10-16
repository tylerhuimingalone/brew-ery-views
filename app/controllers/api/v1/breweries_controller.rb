class Api::V1::BreweriesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: Brewery.all
  end

  def show
    render json: Brewery.find(params["id"])
  end

  def create
    new_brewery = Brewery.new(brewery_params)

    if new_brewery.save
      render json: new_brewery
    else
      render json: new_brewery.errors
    end
  end

  private
  def brewery_params
    JSON.parse(request.body.read)
  end
end
