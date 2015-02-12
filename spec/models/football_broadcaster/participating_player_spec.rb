# == Schema Information
#
# Table name: football_broadcaster_participating_players
#
#  id           :integer          not null, primary key
#  broadcast_id :integer
#  player_id    :integer
#  reserve      :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

module FootballBroadcaster
  RSpec.describe ParticipatingPlayer, :type => :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
