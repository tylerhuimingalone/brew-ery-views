class Api::V1::BreweriesController < ApplicationController
  def index
    render json: Brewery.all
  end
end
