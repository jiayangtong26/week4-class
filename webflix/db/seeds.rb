Movie.delete_all
Director.delete_all
Actor.delete_all
Role.delete_all

imdb_movie_data = JSON.parse(open('db/movies.json').read)
imdb_actor_data = JSON.parse(open('db/actors.json').read)
imdb_director_data = JSON.parse(open('db/directors.json').read)

imdb_movie_data.each do |movie_hash|
  movie = Movie.new
  movie.imdb_key = movie_hash['imdbID']
  movie.title = movie_hash['Title']
  movie.year = movie_hash['Year']
  movie.runtime = movie_hash['Runtime'].to_i
  movie.plot = movie_hash['Plot']
  movie.poster_url = movie_hash['Poster']
  movie.rated = movie_hash['Rated']
  movie.stars = rand(7..10)
  movie.save
end

imdb_director_data.each do |director_hash|
  director = Director.find_by(name: director_hash['Director'])
  if director == nil
    director = Director.new
    director.name = director_hash['Director']
    director.save
  end
  movie = Movie.find_by(imdb_key: director_hash['imdbID'])
  movie.director_id = director.id
  movie.save
end

imdb_actor_data.each do |actor_hash|
  actor = Actor.find_by(name: actor_hash['Actor'])
  if actor == nil
    actor = Actor.new
    actor.name = actor_hash['Actor']
    actor.save
  end
  role = Role.new
  role.movie_id = Movie.find_by(imdb_key: actor_hash['imdbID']).id
  role.actor_id = actor.id
  role.save
end

puts "Seeded succesfully."
