class MoviesController < ApplicationController
  def index
    @movies = Movie.includes(:purchase_options).order(:created_at)
    render :index, formats: :json
  end
end
