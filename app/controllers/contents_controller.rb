class ContentsController < ApplicationController
  def index
    @contents = (Movie.all + Season.all).sort_by(&:created_at)
    render :index, formats: :json
  end

  def show
    @content = ContentFinder.find(params[:id], params[:content_type])
    @purchase = @current_user.purchases.find_by(id: params[:purchase_id])
    if @content
      render :show, formats: :json
    else
      render json: { errors: 'Content not found' }, status: :not_found
    end
  end
end
