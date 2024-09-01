json.id purchase.id
json.content_type purchase.content_type
json.video_quality purchase.video_quality
json.expiration_time purchase.expiration_time

case purchase.content
when Movie
  json.partial! 'movies/movie', movie: purchase.content
when Season
  json.partial! 'seasons/season', season: purchase.content
else
  json.error 'Unknown content type'
end
