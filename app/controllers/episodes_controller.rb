class EpisodesController < ApplicationController
  def show
    @season = Season.find_by(id: params[:season_id])

    if @season
      @episode = @season.episodes.find_by(id: params[:id])

      if @episode
        @purchase = @current_user.purchases.find_by(id: params[:purchase_id])
        render :show, formats: :json
      else
        render json: { errors: 'Episode not found' }, status: :not_found
      end
    else
      render json: { errors: 'Season not found' }, status: :not_found
    end
  end
end
