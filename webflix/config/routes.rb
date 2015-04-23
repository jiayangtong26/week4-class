Rails.application.routes.draw do

  root 'movies#index'

  get '/movies' => 'movies#index'

  # This is a dynamic segment
  get '/movies/:id' => 'movies#show'

  # get '/movies/details' => 'movies#show'

  get '/secret' => 'movies#secret'

end
