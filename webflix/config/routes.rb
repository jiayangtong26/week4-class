Rails.application.routes.draw do

  root 'movies#index'

  get '/movies' => 'movies#index'

  get '/movies/new' => 'movies#new'
  get '/movies/create' => 'movies#create'

  get '/movies/:id' => 'movies#show'

  get '/movies/:id/edit' => 'movies#edit'
  get '/movies/:id/update' => 'movies#update'

  get '/movies/:id/delete' => 'movies#destroy'

end
