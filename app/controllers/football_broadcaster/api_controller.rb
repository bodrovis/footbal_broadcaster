module FootballBroadcaster
  class ApiController < ApplicationController
    respond_to :json

    def teams_players
      @players_hash = {teams: []}
      %w(home guest).each do |side|
        team = Team.find(params[side.to_sym].to_i)
        team_title = team.title.to_sym
        players_with_team = {side: side, title: team_title, players: []}

        team.players.each do |player|
          players_with_team[:players] << {
              id: player.id,
              full_name: player.full_name
          }
        end
        @players_hash[:teams] << players_with_team
      end
      respond_with @players_hash
    end
  end
end