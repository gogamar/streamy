json.purchase_options do
  json.array! movie.purchase_options do |option|
    json.video_quality option.video_quality

    if @user.active_purchase?(movie)
      purchased_option = @user.active_purchases.find do |purchase|
        purchase.content_id == movie.id && purchase.content_type == 'Movie'
      end
    end

    if purchased_option
      # If the movie has been purchased, check if the current option's video quality matches
      if purchased_option.video_quality == option.video_quality
        json.purchased true
      else
        json.purchased false
        json.message "Already purchased in a different video quality"
      end
    else
      # If the movie has not been purchased at all
      json.price option.price
      json.purchase_url "#{request.base_url}/users/#{params[:user_id]}/purchases?content_type=Movie&content_id=#{movie.id}&purchase_option_id=#{option.id}"
      json.purchased false
    end
  end
end
