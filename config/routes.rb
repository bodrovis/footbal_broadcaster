FootballBroadcaster::Engine.routes.draw do
  resources :broadcasts, only: [:index, :show, :new, :create]

  root 'broadcasts#index'
end
