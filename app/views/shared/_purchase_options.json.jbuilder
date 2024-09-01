json.purchase_options do
  json.array! content.purchase_options do |option|
    json.video_quality option.video_quality

    if purchase
      json.purchased true
      json.watch_url user_content_url(@current_user, purchase.content, content_type: purchase.content_type, video_quality: purchase.video_quality, purchase_id: purchase.id)
    else
      json.price option.price
      json.purchased false
      json.purchase_url user_purchases_url(@current_user, content_type: content.class.name, content_id: content.id, purchase_option_id: option.id)
    end
  end
end
