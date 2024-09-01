class SeasonsController < ApplicationController
  def index
    @seasons = Season.includes(:episodes, :purchase_options).order(:created_at)
    render :index, formats: :json
  end
end
