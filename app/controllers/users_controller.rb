class UsersController < ApplicationController
  def library
    @current_user = User.find_by(id: params[:id])

    if @current_user
      cache_key = "user/#{@current_user.id}/active_purchases"

      @active_purchases = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
        @current_user.active_purchases.to_a
      end

      render :library, formats: :json
    else
      render json: { errors: 'User not found' }, status: :not_found
    end
  rescue StandardError => e
    Rails.logger.error("Failed to fetch user library: #{e.message}")
    render json: { error: 'An error occurred while fetching the user library.' }, status: :internal_server_error
  end
end
