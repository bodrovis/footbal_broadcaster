require 'rails_helper'

RSpec.describe "New broadcast", js: true do
  let!(:home_team) {FactoryGirl.create(:team_with_players, title: 'Home')}
  let!(:guest_team) {FactoryGirl.create(:team_with_players, title: 'Guest')}

  it "should allow to create a new broadcast" do
    visit football_broadcaster.root_path
    click_link 'New broadcast'
    within '#new_broadcast' do
      fill_in 'Title', with: 'test broadcast'
      select 'Home', from: 'Home team'
      select 'Guest', from: 'Guest team'
      players = home_team.players + guest_team.players
      players.each do |p|
        click_link 'add player'
        within(:xpath, "//div[@id='participating_players_list']/div[@class='nested-fields'][1]") do
          select p.full_name, from: 'Player'
        end
      end
      click_button 'Create broadcast'
    end
    flash_message :success, 'Saved!'
    within '#broadcasts' do
      expect(page).to have_content('test broadcast')
    end
  end
end