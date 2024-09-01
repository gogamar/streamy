class EndpointsController < ApplicationController
  def index
    user = User.last

    if user
      render json: {
        library: library_user_url(user),
        movies: user_movies_url(user),
        seasons: user_seasons_url(user),
        contents: user_contents_url(user),
        purchases: user_purchases_url(user)
      }
    else
      render json: { error: "No users found" }, status: :not_found
    end
  end
end
