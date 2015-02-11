require 'rails_helper'

RSpec.describe "New broadcast" do
  before do
    2.times {FactoryGirl.create(:team)}
  end

  it "should allow to create a new broadcast" do
    visit football_broadcaster.root_path
    click_link 'New broadcast'
    within '#new_broadcast' do
      fill_in 'Title', with: 'test broadcast'
      select 'Team 1', from: 'Home team'
      select 'Team 2', from: 'Guest team'
      click_button 'Create Broadcast'
    end
    flash_message :success, 'Saved!'
    within '#broadcasts' do
      expect(page).to have_content('test broadcast')
    end
  end
end