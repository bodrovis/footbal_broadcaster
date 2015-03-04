require_dependency "football_broadcaster/application_controller"

module FootballBroadcaster
  class BroadcastsController < ApplicationController
    def index
      @broadcasts = FootballBroadcaster::Broadcast.all
    end

    def show
      @broadcast = FootballBroadcaster::Broadcast.includes(:field_players, :log_messages).find(params[:id])
      @field_players = @broadcast.field_players.group_by(&FootballBroadcaster.team_class.name.downcase.to_sym)
    end

    def new
      @broadcast = FootballBroadcaster::Broadcast.new
    end

    def create
      @broadcast = FootballBroadcaster::Broadcast.new(broadcast_params)
      if @broadcast.save
        flash[:success] = 'Saved!'
        redirect_to football_broadcaster.root_path
      else
        render 'new'
      end
    end

    def edit
      @broadcast = FootballBroadcaster::Broadcast.includes(:log_messages).find(params[:id])
      @log_message = @broadcast.log_messages.build
    end

    private

    def broadcast_params
      params.require(:broadcast).permit(:title, :home_team_id, :guest_team_id,
                                        participating_players_attributes: [:player_id, :reserve])
    end
  end
end
