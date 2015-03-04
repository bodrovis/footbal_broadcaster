require_dependency "football_broadcaster/application_controller"

module FootballBroadcaster
  class LogMessagesController < ApplicationController
    def create
      @log_message = FootballBroadcaster::LogMessage.new(log_message_params)
      @log_message.save
      redirect_to edit_broadcast_path(@log_message.broadcast)
    end

    private

    def log_message_params
      params.require(:log_message).permit(:body, :broadcast_id, :minutes, :seconds)
    end
  end
end