class ContentsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @contents = (Movie.all + Season.all).sort_by(&:created_at)
    render :index, formats: :json
  end
end
