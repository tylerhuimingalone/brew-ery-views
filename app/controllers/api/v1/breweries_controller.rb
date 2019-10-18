class Api::V1::BreweriesController < ApplicationController
  protect_from_forgery unless: -> { request.format.json? }

  def index
    render json: { breweries: Brewery.all, user: user_signed_in? }
  end

  def show
    render json: Brewery.find(params["id"])
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
  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip, :image)
  end
end
