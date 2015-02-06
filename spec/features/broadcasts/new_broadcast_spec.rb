require 'rails_helper'

RSpec.describe "Broadcasts" do
  it "should allow to create a new broadcast" do
    visit football_broadcaster.root_path
    click_link 'New broadcast'
    within '#new_broadcast' do
      fill_in 'Name', with: 'test'
      click_button 'Create Broadcast'
    end
    flash_message :success, 'Saved!'
  end
end