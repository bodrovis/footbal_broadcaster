module FootballBroadcaster
  class ApiController < ApplicationController
    respond_to :json

    def teams_players
      team_ids = params[:teams].to_s.split(',')
      players_hash = {teams: []}
      team_ids.uniq.sort.each do |id|
        team = Team.find(id.to_i)
        team_title = team.title.to_sym
        players_with_team = {title: team_title, players: []}
        team.players.each do |player|
          players_with_team[:players] << {
              id: player.id,
              full_name: player.full_name
          }
        end
        players_hash[:teams] << players_with_team
      end
      respond_with players_hash
    end
  end
end