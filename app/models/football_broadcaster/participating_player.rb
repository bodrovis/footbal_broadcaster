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

module FootballBroadcaster
  class ParticipatingPlayer < ActiveRecord::Base
    belongs_to :broadcast, class_name: 'FootballBroadcaster::Broadcast'
    belongs_to :player, class_name: 'Player'
  end
end
