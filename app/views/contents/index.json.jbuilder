json.array! @contents do |content|
  case content
  when Movie
    json.partial! 'movies/movie', movie: content
  when Season
    json.partial! 'seasons/season', season: content
  end
end
