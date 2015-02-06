# == Schema Information
#
# Table name: football_broadcaster_broadcasts
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

module FootballBroadcaster
  class Broadcast < ActiveRecord::Base
    validates :name, presence: true
  end
end
