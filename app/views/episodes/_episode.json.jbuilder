json.episode_id episode.id
json.episode_number episode.number
json.title episode.title
json.plot episode.plot

if purchase
  json.watch_url user_season_episode_url(@current_user, episode.season, episode, video_quality: purchase.video_quality, purchase_id: purchase.id)
end
