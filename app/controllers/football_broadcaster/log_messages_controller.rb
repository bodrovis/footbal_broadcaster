require_dependency "football_broadcaster/application_controller"

module FootballBroadcaster
  class LogMessagesController < ApplicationController
    def create
      @log_message = FootballBroadcaster::LogMessage.new(log_message_params)
      if @log_message.save
        redirect_to edit_broadcast_path(@log_message.broadcast)
      else
        @broadcast = FootballBroadcaster::Broadcast.includes(:log_messages).find(@log_message.broadcast_id)
        render 'football_broadcaster/broadcasts/edit'
      end
    end

    private

    def log_message_params
      params.require(:log_message).permit(:body, :broadcast_id, :minutes, :seconds)
    end
  end
end