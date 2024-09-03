class EpisodesController < ApplicationController
  def show
    @season = Season.find_by(id: params[:season_id])

    if @season
      # Cache the episode only if the user is logged in
      if @current_user
        cache_key = "season/#{@season.id}/episode/#{params[:id]}"
        @episode = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
          @season.episodes.find_by(id: params[:id])
        end

        @purchase = @current_user.purchases.find_by(id: params[:purchase_id]) if @episode
      else
        @episode = @season.episodes.find_by(id: params[:id])
      end

      if @episode
        render :show, formats: :json
      else
        render json: { errors: 'Episode not found' }, status: :not_found
      end
    else
      render json: { errors: 'Season not found' }, status: :not_found
    end
  rescue StandardError => e
    Rails.logger.error("Failed to fetch episode: #{e.message}")
    render json: { error: 'An error occurred while fetching the episode.' }, status: :internal_server_error
  end

  def clear_cache(season)
    episodes = season.episodes
    episodes.each do |episode|
      Rails.cache.delete("season/#{season.id}/episode/#{episode.id}")
    end
  end
end
