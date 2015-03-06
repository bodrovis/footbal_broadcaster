module FootballBroadcaster
  class ApiController < ApplicationController
    respond_to :json

    def log_for_broadcast
      @log_messages = {new_messages: []}
      broadcast = FootballBroadcaster::Broadcast.find(params[:broadcast_id])
      # Oldest first
      messages = params[:last_log_message_id] ?
          broadcast.log_messages.where('id > ?', params[:last_log_message_id].to_i) :
          broadcast.log_messages
      messages.reverse.each do |message|
        @log_messages[:new_messages] << {
            id: message.id,
            body: message.body,
            match_time: message.match_time
        }
      end
      respond_with @log_messages
    end

    def teams_players
      @players_hash = {teams: []}
      %w(home guest).each do |side|
        team = FootballBroadcaster.team_class.to_s.find(params[side.to_sym].to_i)
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