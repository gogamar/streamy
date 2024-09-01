json.id movie.id
json.title movie.title
json.plot movie.plot

json.partial! 'movies/purchase_options', movie: movie unless controller.controller_name == 'users'
