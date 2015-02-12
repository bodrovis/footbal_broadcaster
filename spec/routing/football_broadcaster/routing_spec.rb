require 'rails_helper'

module FootballBroadcaster
  RSpec.describe ApiController, type: :routing do
    it "routes api requests" do
      expect(get: "football_broadcaster/api/teams_players.json").to route_to(controller: "api" , action: "teams_players")
    end
  end
end