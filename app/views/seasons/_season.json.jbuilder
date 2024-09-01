json.id season.id
json.title season.title
json.plot season.plot
json.season_number season.number

json.partial! 'seasons/purchase_options', season: season unless controller.controller_name == 'users'

json.episodes season.episodes, partial: 'seasons/episode', as: :episode
