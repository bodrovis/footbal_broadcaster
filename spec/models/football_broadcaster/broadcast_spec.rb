# == Schema Information
#
# Table name: football_broadcaster_broadcasts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

module FootballBroadcaster
  RSpec.describe Broadcast do
    it "should not be valid without a name" do
      broadcast = Broadcast.new
      expect(broadcast).not_to be_valid
    end
  end
end
