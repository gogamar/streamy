class SeasonsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @seasons = Season.includes(:episodes, :purchase_options).order(:created_at)
    @purchased_seasons = @user && @user.purchases.where(content_type: 'Season')
    @purchased_seasons_details = @purchased_seasons ? @purchased_seasons.pluck(:content_id, :video_quality) : []
    render :index, formats: :json
  end
end
