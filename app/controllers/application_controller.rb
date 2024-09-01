class ApplicationController < ActionController::API
  before_action :set_current_user

  private

  def set_current_user
    @current_user = User.find_by(id: params[:user_id])
  end
end
