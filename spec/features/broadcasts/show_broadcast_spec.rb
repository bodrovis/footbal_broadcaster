require 'rails_helper'

RSpec.describe "Show broadcast" do
  let(:home_team) {FactoryGirl.create(:team)}
  let(:guest_team) {FactoryGirl.create(:team)}
  let(:broadcast) {FactoryGirl.create(:broadcast, home_team: home_team, guest_team: guest_team)}

  it "should display home and guest teams' titles" do
    visit football_broadcaster.broadcast_path(broadcast)
    within 'h1' do
      expect(page).to have_content(home_team.title)
      expect(page).to have_content(guest_team.title)
    end
  end
end