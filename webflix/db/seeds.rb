Movie.delete_all
Actor.delete_all
Role.delete_all

imdb_movie_data = JSON.parse(open('db/movies.json').read)
imdb_actor_data = JSON.parse(open('db/actors.json').read)
imdb_director_data = JSON.parse(open('db/directors.json').read)

imdb_movie_data.each do |movie_info|
  movie = Movie.new
  movie.imdb_key = movie_info['imdbID']
  movie.title = movie_info['Title']
  movie.year = movie_info['Year']
  movie.runtime = movie_info['Runtime'].to_i
  movie.plot = movie_info['Plot']
  movie.poster_url = movie_info['Poster']
  movie.rated = movie_info['Rated']
  movie.stars = rand(1..10)
  movie.save
end

imdb_director_data.each do |director_info|
  director = Director.find_by(name: director_info['Director'])
  if director == nil
    director = Director.new
    director.name = director_info['Director']
    director.save
  end
  movie = Movie.find_by(imdb_key: director_info['imdbID'])
  movie.director_id = director.id
  movie.save
end

imdb_actor_data.each do |actor_info|
  actor = Actor.find_by(name: actor_info['Actor'])
  if actor == nil
    actor = Actor.new
    actor.name = actor_info['Actor']
    actor.save
  end
  role = Role.new
  role.movie_id = Movie.find_by(imdb_key: actor_info['imdbID']).id
  role.actor_id = actor.id
  role.save
end

puts "Seeded succesfully."
