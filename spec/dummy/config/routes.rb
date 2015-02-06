Rails.application.routes.draw do

  mount FootballBroadcaster::Engine => "/football_broadcaster"
end
