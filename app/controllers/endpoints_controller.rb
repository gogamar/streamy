class EndpointsController < ApplicationController
  def index
    all_users = User.all

    if all_users.present?
      users_endpoints = all_users.map do |user|
        {
          user_id: user.email,
          library: library_user_url(user),
          movies: user_movies_url(user),
          seasons: user_seasons_url(user),
          movies_and_seasons: user_contents_url(user)
        }
      end

      render json: { users: users_endpoints }, status: :ok
    else
      render json: { error: "No users found" }, status: :not_found
    end
  end
end
