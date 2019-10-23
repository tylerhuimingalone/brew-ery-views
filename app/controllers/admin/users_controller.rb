class Admin::UsersController < ApplicationController
  before_action :authorize_user

  def index
    @users = User.all
    @current_user = current_user
  end

  def update
    user = User.find(params[:id])

    if user.admin
      user.update(admin: false)
    else
      user.update(admin: true)
    end

    redirect_to admin_users_path
  end

  def authorize_user
   if !user_signed_in? || !current_user.admin?
     raise ActionController::RoutingError.new("Not Found")
     # line 8 should show 404 'must be an admin' error
   end
 end
end
