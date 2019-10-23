class Admin::BreweriesController < ApplicationController
  before_action :authorize_user

  def index
    @breweries = Brewery.all
  end

  def destroy
    brewery = Brewery.find(params[:id])
    brewery.destroy
    redirect_to admin_breweries_path
  end

  def edit
    @brewery = Brewery.find(params[:id])
    @state_array = [ 'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NE', 'NH', 'NJ',  'NM', 'NV', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY' ]
  end

  def update
    @brewery = Brewery.find(params[:id])

    if @brewery.update(brewery_params)
      redirect_to admin_breweries_path
    else
      @errors = @brewery.errors.full_messages.to_sentence
      @state_array = [ 'AK', 'AL', 'AR', 'AZ', 'CA', 'CO', 'CT', 'DC', 'DE', 'FL', 'GA', 'HI', 'IA', 'ID', 'IL', 'IN', 'KS', 'KY', 'LA', 'MA', 'MD', 'ME', 'MI', 'MN', 'MO', 'MS', 'MT', 'NE', 'NH', 'NJ',  'NM', 'NV', 'NY', 'NC', 'ND', 'OH', 'OK', 'OR', 'PA', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VA', 'VI', 'VT', 'WA', 'WI', 'WV', 'WY' ]
      render :edit
    end
  end

  private

  def brewery_params
    params.require(:brewery).permit(:name, :address, :city, :state, :zip, :image)
  end

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Must be an admin")
    end
  end
end
