class MoviesController < ApplicationController
  # includes - avoid N+1 query problem where a separate query is executed for each associated record
  def index
    @user = User.find_by(id: params[:user_id])
    @movies = Movie.includes(:purchase_options).order(:created_at)


    @purchased_movies = @user && @user.purchases.where(content_type: 'Movie')
    puts "these are the purchased movies #{@purchased_movies}"
    @purchased_movies_details = @purchased_movies ? @purchased_movies.pluck(:content_id, :video_quality) : []
    render :index, formats: :json
  end
end
