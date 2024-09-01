class UsersController < ApplicationController
  def library
    @current_user = User.find_by(id: params[:id])
    # Fetch only active purchases and order them by expiration time (ascending)
    @active_purchases = @current_user.active_purchases

    render :library, formats: :json
  end
end
