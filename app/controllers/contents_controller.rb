class ContentsController < ApplicationController
  def index
    @contents = Rails.cache.fetch("contents/all", expires_in: 12.hours) do
      (Movie.all + Season.all).sort_by(&:created_at)
    end
    render :index, formats: :json
  rescue StandardError => e
    Rails.logger.error("Failed to fetch contents: #{e.message}")
    render json: { error: 'An error occurred while fetching contents.' }, status: :internal_server_error
  end

  def show
    # Cache content for viewing only if the user is logged in
    if @current_user
      cache_key = "content/#{params[:content_type].downcase}/#{params[:id]}"
      @content = Rails.cache.fetch(cache_key, expires_in: 12.hours) do
        ContentFinder.find(params[:id], params[:content_type])
      end
      @purchase = @current_user.purchases.find_by(id: params[:purchase_id]) if params[:purchase_id]
    else
      # If no user is logged in, fetch content without caching
      @content = ContentFinder.find(params[:id], params[:content_type])
    end

    if @content
      render :show, formats: :json
    else
      render json: { errors: 'Content not found' }, status: :not_found
    end
  rescue StandardError => e
    Rails.logger.error("Failed to fetch content: #{e.message}")
    render json: { error: 'An error occurred while fetching content.' }, status: :internal_server_error
  end
end
