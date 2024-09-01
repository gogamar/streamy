user1 = User.create!(email: "user1@example.com")
user2 = User.create!(email: "user2@example.com")

# Create Purchase Options
option_hd = PurchaseOption.create!(price: 2.99, video_quality: "HD")
option_sd = PurchaseOption.create!(price: 1.99, video_quality: "SD")

# Create Movies
movie1 = Movie.create!(title: "The Matrix", plot: "A computer hacker learns about the true nature of reality.")
movie2 = Movie.create!(title: "Inception", plot: "A thief who enters the dreams of others to steal secrets from their subconscious.")
movie3 = Movie.create!(title: "Interstellar", plot: "A team of explorers travels through a wormhole in space in an attempt to ensure humanity's survival.")
movie4 = Movie.create!(title: "The Dark Knight", plot: "Batman raises the stakes in his war on crime with the help of Lieutenant James Gordon and District Attorney Harvey Dent.")
movie5 = Movie.create!(title: "Dune", plot: "In the distant future, noble families vie for control of a vital spice that can extend human life and expand consciousness.")
movie6 = Movie.create!(title: "The Batman", plot: "Batman uncovers corruption in Gotham City that connects to his own family while facing the serial killer known as The Riddler.")
movie7 = Movie.create!(title: "Everything Everywhere All at Once", plot: "A family’s adventure through multiple dimensions to save the multiverse.")

# Create Seasons
season1 = Season.create!(title: "Severance - Season 1", plot: "The first season of the show where employees navigate their unique work-life balance.", number: 1)
season2 = Season.create!(title: "The Bear - Season 1", plot: "A young chef returns to Chicago to run his family’s restaurant.", number: 1)
season3 = Season.create!(title: "Ted Lasso - Season 1", plot: "An American football coach is hired to manage a struggling English soccer team.", number: 1)
season4 = Season.create!(title: "Succession - Season 4", plot: "The Roy family continues their high-stakes power struggle for control of their media empire.", number: 4)
season5 = Season.create!(title: "Stranger Things - Season 1", plot: "A group of kids uncover a government conspiracy.", number: 1)
season6 = Season.create!(title: "The Crown - Season 2", plot: "The next chapter in the life of Queen Elizabeth II.", number: 2)
season7 = Season.create!(title: "Breaking Bad - Season 1", plot: "A high school chemistry teacher turned methamphetamine manufacturer.", number: 1)
season8 = Season.create!(title: "The Office - Season 1", plot: "The everyday lives of office employees working at Dunder Mifflin's Scranton, PA branch.", number: 1)

# Create Episodes for Season 1 of Severance
Episode.create!(title: "Episode 1", plot: "The unique severance program is introduced and employees start adjusting.", number: 1, season: season1)
Episode.create!(title: "Episode 2", plot: "Employees face new challenges and begin to question the company's true motives.", number: 2, season: season1)
Episode.create!(title: "Episode 3", plot: "Personal and work lives start to blend, leading to unforeseen consequences.", number: 3, season: season1)
Episode.create!(title: "Episode 4", plot: "Secrets start to unravel as employees dig deeper into the company’s operations.", number: 4, season: season1)

# Create Episodes for Season 1 of The Bear
Episode.create!(title: "Pilot", plot: "Carmen “Carmy” Berzatto takes over his family’s failing restaurant.", number: 1, season: season2)
Episode.create!(title: "Second Service", plot: "Carmy struggles with the challenges of running the restaurant.", number: 2, season: season2)
Episode.create!(title: "Brigade", plot: "The kitchen crew faces growing pains as they adjust to Carmy’s leadership.", number: 3, season: season2)
Episode.create!(title: "The Bear", plot: "Carmy tries to balance personal and professional challenges.", number: 4, season: season2)

# Create Episodes for Season 1 of Ted Lasso
Episode.create!(title: "Pilot", plot: "Ted Lasso is hired to manage an English soccer team despite having no experience.", number: 1, season: season3)
Episode.create!(title: "Biscuits with the Boss", plot: "Ted tries to win over the skeptical team and management.", number: 2, season: season3)
Episode.create!(title: "The Coach's Daughter", plot: "Ted and the team face off against their rivals in a key match.", number: 3, season: season3)
Episode.create!(title: "The Hope That Kills You", plot: "The team faces a crucial game with high stakes.", number: 4, season: season3)

# Create Episodes for Season 4 of Succession
Episode.create!(title: "The Munsters", plot: "The Roy family deals with fallout from recent events.", number: 1, season: season4)
Episode.create!(title: "Rehearsal Dinner", plot: "The Roys face internal conflicts during a family event.", number: 2, season: season4)
Episode.create!(title: "Connor's Wedding", plot: "The family is thrown into turmoil as major changes loom.", number: 3, season: season4)
Episode.create!(title: "The Last Supper", plot: "The family reaches a breaking point as they grapple with their future.", number: 4, season: season4)

# Create Episodes for Season 1 of Stranger Things
Episode.create!(title: "Chapter One: Stranger Things", plot: "The kids find themselves in a mysterious situation.", number: 1, season: season5)
Episode.create!(title: "Chapter Two: The Weirdo on Maple Street", plot: "The search for the missing boy continues.", number: 2, season: season5)
Episode.create!(title: "Chapter Three: Holly, Jolly", plot: "The search for Will intensifies.", number: 3, season: season5)
Episode.create!(title: "Chapter Four: The Body", plot: "The investigation into Will's disappearance deepens.", number: 4, season: season5)

# Create Episodes for Season 2 of The Crown
Episode.create!(title: "Episode 1", plot: "A new chapter begins in the royal life.", number: 1, season: season6)
Episode.create!(title: "Episode 2", plot: "Tensions rise in the monarchy.", number: 2, season: season6)
Episode.create!(title: "Episode 3", plot: "The Queen faces new challenges.", number: 3, season: season6)
Episode.create!(title: "Episode 4", plot: "The royal family endures personal and political trials.", number: 4, season: season6)

# Create Episodes for Season 1 of Breaking Bad
Episode.create!(title: "Pilot", plot: "High school chemistry teacher Walter White starts manufacturing methamphetamine.", number: 1, season: season7)
Episode.create!(title: "Cat's in the Bag...", plot: "Walter and Jesse try to deal with the aftermath of their first drug deal.", number: 2, season: season7)
Episode.create!(title: "...And the Bag's in the River", plot: "Walter and Jesse face the consequences of their actions.", number: 3, season: season7)
Episode.create!(title: "Cancer Man", plot: "Walter's health issues affect his personal and professional life.", number: 4, season: season7)

# Create Episodes for Season 1 of The Office
Episode.create!(title: "Pilot", plot: "The staff of the Dunder Mifflin office is introduced.", number: 1, season: season8)
Episode.create!(title: "Diversity Day", plot: "Michael Scott tries to improve diversity in the office.", number: 2, season: season8)
Episode.create!(title: "Health Care", plot: "Michael assigns Dwight the task of finding a new health care plan.", number: 3, season: season8)
Episode.create!(title: "The Alliance", plot: "Jim and Dwight form an unlikely alliance.", number: 4, season: season8)


all_movies = Movie.all
all_movies.each do |movie|
  movie.purchase_options << option_hd
  movie.purchase_options << option_sd
end

all_seasons = Season.all
all_seasons.each do |season|
  season.purchase_options << option_hd
  season.purchase_options << option_sd
end

def create_random_purchases(user, movies, seasons, options)
  random_movies = movies.shuffle.take(3)
  random_season = seasons.shuffle.first

  random_movies.each do |movie|
    option = options.sample
    Purchase.create!(
      user: user,
      purchase_option: option,
      content: movie,
      price: option.price,
      video_quality: option.video_quality,
      expiration_time: 2.days.from_now
    )
  end

  option = options.sample
  Purchase.create!(
    user: user,
    purchase_option: option,
    content: random_season,
    price: option.price,
    video_quality: option.video_quality,
    expiration_time: 2.days.from_now
  )
end

[ user1, user2 ].each do |user|
  create_random_purchases(user, all_movies, all_seasons, [option_hd, option_sd])
end
