require 'rails_helper'
require 'pry-rails'
RSpec.describe "Show broadcast" do
  let(:home_team) {FactoryGirl.create(:team_with_players, title: 'Home')}
  let(:guest_team) {FactoryGirl.create(:team_with_players, title: 'Guest')}
  let(:broadcast) {FactoryGirl.create(:broadcast_with_players, home_team: home_team, guest_team: guest_team,
                                      players: home_team.players + guest_team.players)}

  it "should display home and guest teams' titles" do
    visit football_broadcaster.broadcast_path(broadcast)
    within 'h1' do
      expect(page).to have_content(home_team.title)
      expect(page).to have_content(guest_team.title)
    end
  end
end