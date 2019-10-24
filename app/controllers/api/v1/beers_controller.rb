class Api::V1::BeersController < ApplicationController
  def index
    brewery = Brewery.find(params[:brewery_id])
    render json: { beers: brewery.beers }
  end
end
