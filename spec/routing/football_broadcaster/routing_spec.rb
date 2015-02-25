require 'rails_helper'

module FootballBroadcaster
  RSpec.describe "API routes", type: :routing do
    routes { FootballBroadcaster::Engine.routes }

    it "has route to fetch teams' players" do
      expect({get: "/api/teams_players.json"}).to route_to(
                                                      controller: "football_broadcaster/api",
                                                      action: "teams_players",
                                                      format: "json"
                                                  )
    end
  end
end