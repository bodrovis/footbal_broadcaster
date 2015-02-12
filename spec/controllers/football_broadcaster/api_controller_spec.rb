require 'rails_helper'

module FootballBroadcaster
  RSpec.describe ApiController, type: :controller do
    describe 'GET teams_players' do
      let(:home_team) {FactoryGirl.create(:team)}
      let(:guest_team) {FactoryGirl.create(:team)}
      let(:home_team_player) {FactoryGirl.create(:player, team: home_team)}
      let(:guest_team_player) {FactoryGirl.create(:player, team: guest_team)}

      it "responds" do
        get :teams_players, format: :json
        #, home: home_team.id, guest: guest_team.id
      end
    end
  end
end