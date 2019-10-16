class Api::V1::BreweriesController < ApplicationController
  def index
    render json: Brewery.all
  end

  def show
    render json: Brewery.find(params["id"])
  end
end
