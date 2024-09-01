json.content_id content.id
json.content_created_at content.created_at
json.content_type content.class.name
json.title content.title
json.plot content.plot
json.season_number content.number if content.is_a?(Season)

if purchase
  json.purchased true unless controller.action_name == 'show'
  json.video_quality purchase.video_quality
  unless controller.action_name == 'show'
    json.watch_url user_content_url(@current_user, purchase.content, content_type: purchase.content_type, video_quality: purchase.video_quality, purchase_id: purchase.id)
  end
else
  json.purchased false
  json.partial! 'shared/purchase_options', locals: { content: content, purchase: nil }
end

if content.is_a?(Season)
  # do not include episodes in /seasons endpoint
  unless controller.controller_name == 'contents' && controller.action_name == 'index'
    json.episodes content.episodes, partial: 'episodes/episode', as: :episode, locals: { purchase: purchase }
  end
end
