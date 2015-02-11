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

module FootballBroadcaster
  class Broadcast < ActiveRecord::Base
    belongs_to :home_team, class_name: FootballBroadcaster.team_class.to_s
    belongs_to :guest_team, class_name: FootballBroadcaster.team_class.to_s

    validates :title, presence: true
    validates :home_team_id, presence: true
    validates :guest_team_id, presence: true
    validate :guest_team_cannot_be_same_as_home_team

    def guest_team_cannot_be_same_as_home_team
      if guest_team == home_team
        errors.add(:guest_team, 'Can\'t be the same as the home team.')
      end
    end
  end
end
