class MoviesController < ApplicationController
  def index
    @movies = Rails.cache.fetch('movies/all', expires_in: 12.hours) do
      Movie.order(:created_at).to_a
    end

    render :index, formats: :json
  rescue StandardError => e
    Rails.logger.error("Failed to fetch movies: #{e.message}")
    render json: { error: 'An error occurred while fetching movies.' }, status: :internal_server_error
  end
end
