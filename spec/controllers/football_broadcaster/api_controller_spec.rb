require 'rails_helper'
require 'pry-rails'
module FootballBroadcaster
  RSpec.describe ApiController, type: :controller do
    routes { FootballBroadcaster::Engine.routes }

    describe 'GET teams_players' do
      let!(:home_team) {FactoryGirl.create(:team_with_players)}
      let!(:guest_team) {FactoryGirl.create(:team_with_players)}
      let!(:params) { {guest: guest_team.id, home: home_team.id, format: :json} }

      it "returns players from specified teams" do
        get :teams_players, params
        expect(response).to have_http_status(:success)
        expect(assigns(:players_hash)[:teams].length).to eq(2)
        expect(assigns(:players_hash)[:teams][0][:side]).to eq('home') or expect(assigns(:players_hash)[:teams][1][:side]).to eq('guest')
        expect(assigns(:players_hash)[:teams][0][:players].length).to eq(11)
        expect(assigns(:players_hash)[:teams][1][:players].length).to eq(11)
      end
    end
  end
end