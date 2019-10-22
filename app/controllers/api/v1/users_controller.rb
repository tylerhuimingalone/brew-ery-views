class Api::V1::UsersController < ApplicationController
  before_action :authorize_user

  def index
    render json: User.all
  end

  protected

  def authorize_user
    if !user_signed_in? || !current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
      # line 8 should show 404 'must be an admin' error
    end
  end
end
