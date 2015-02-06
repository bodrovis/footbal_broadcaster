FootballBroadcaster::Engine.routes.draw do
  resources :broadcasts

  root 'broadcasts#index'
end
