class SeasonsController < ApplicationController
  def index
    @seasons = Rails.cache.fetch('seasons/all', expires_in: 12.hours) do
      Season.includes(:episodes, :purchase_options).order(:created_at).to_a
    end

    render :index, formats: :json
  rescue StandardError => e
    Rails.logger.error("Failed to fetch seasons: #{e.message}")
    render json: { error: 'An error occurred while fetching seasons.' }, status: :internal_server_error
  end

  def clear_cache
    Rails.cache.delete("seasons/all")
  end
end
