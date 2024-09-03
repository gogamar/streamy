json.movies do
  json.partial! 'contents/contents', contents: @movies
end
