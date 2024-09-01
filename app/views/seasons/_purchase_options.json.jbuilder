json.purchase_options do
  json.array! season.purchase_options do |option|
    json.video_quality option.video_quality

    # Find the purchased option for the current movie
    if @user.active_purchase?(season)
      purchased_option = @user.active_purchases.find do |id, type, quality|
        id == season.id && type == 'Season'
      end
    end

    if @user.active_purchase?(season)
      purchased_option = @user.active_purchases.find do |purchase|
        purchase.content_id == season.id && purchase.content_type == 'Season'
      end
    end

    if purchased_option
      # If the season has been purchased, check if the current option's video quality matches
      if purchased_option.video_quality == option.video_quality
        json.purchased true
      else
        json.purchased false
        json.message "Already purchased in a different video quality"
      end
    else
      # If the season has not been purchased at all
      json.price option.price
      json.purchase_url "#{request.base_url}/users/#{params[:user_id]}/purchases?content_type=Season&content_id=#{season.id}&purchase_option_id=#{option.id}"
      json.purchased false
    end
  end
end
