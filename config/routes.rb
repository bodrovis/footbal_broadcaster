FootballBroadcaster::Engine.routes.draw do
  namespace :api do
    get '/teams_players', action: 'teams_players', as: :teams_players
  end

  resources :broadcasts, only: [:index, :show, :new, :create]

  root 'broadcasts#index'
end
