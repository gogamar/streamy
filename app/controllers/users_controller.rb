class UsersController < ApplicationController
  def library
    @user = User.find(params[:id])

    # Fetch only active purchases and order them by expiration time (ascending)
    @active_purchases = @user.purchases
                             .where('expiration_time > ?', Time.current)
                             .includes(content: :episodes)
                             .order(:expiration_time)

    render :library, formats: :json
  end
end
