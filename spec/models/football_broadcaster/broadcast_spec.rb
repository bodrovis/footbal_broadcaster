# == Schema Information
#
# Table name: football_broadcaster_broadcasts
#
#  id            :integer          not null, primary key
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  home_team_id  :integer
#  guest_team_id :integer
#

require 'rails_helper'

module FootballBroadcaster
  RSpec.describe Broadcast do
    let!(:home_team) {FactoryGirl.create(:team)}
    let!(:guest_team) {FactoryGirl.create(:team)}

    context "validations" do
      it "should not be valid without a title, guest and home team ids" do
        broadcast = Broadcast.new
        expect(broadcast).not_to be_valid
      end

      it "should not be valid with the same team assigned as home and guest" do
        broadcast = FactoryGirl.build_stubbed(:broadcast, home_team: home_team, guest_team: home_team)
        expect(broadcast).not_to be_valid
      end
    end

    context "associations" do
      let(:broadcast) {FactoryGirl.create(:broadcast, home_team: home_team, guest_team: guest_team)}

      it "should belong to home and guest teams" do
        expect(broadcast.home_team.title).to eq(home_team.title)
        expect(broadcast.guest_team.title).to eq(guest_team.title)
      end

      it "should allow fetching players" do
        [home_team, guest_team].each do |team|
          2.times do |i|
            FactoryGirl.create(:player, team: team)
          end
        end

        expect(broadcast.home_team.players.length).to eq(2)
      end
    end
  end
end