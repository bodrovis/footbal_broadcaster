require_dependency "football_broadcaster/application_controller"

module FootballBroadcaster
  class BroadcastsController < ApplicationController
    def index
      @broadcasts = FootballBroadcaster::Broadcast.all
    end

    def show
      @broadcast = FootballBroadcaster::Broadcast.find(params[:id])
    end

    def new
      @broadcast = FootballBroadcaster::Broadcast.new
    end

    def create
      @broadcast = FootballBroadcaster::Broadcast.new(broadcast_params)
      if @broadcast.save
        flash[:success] = 'Saved!'
        redirect_to football_broadcaster.root_path
      end
    end

    private

    def broadcast_params
      params.require(:broadcast).permit(:title, :home_team_id, :guest_team_id)
    end
  end
end
