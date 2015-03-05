FootballBroadcaster::Engine.routes.draw do
  namespace :api do
    get '/teams_players', action: 'teams_players', as: :teams_players
    get '/log_for_broadcast', action: 'log_for_broadcast', as: :log_for_broadcast
  end

  resources :broadcasts#, only: [:index, :show, :new, :create]
  resources :log_messages, only: [:create]

  root 'broadcasts#index'
end
