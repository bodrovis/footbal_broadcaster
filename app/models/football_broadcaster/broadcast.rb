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
    has_many :participating_players, class_name: 'FootballBroadcaster::ParticipatingPlayer', foreign_key: :broadcast_id
    has_many :field_players, through: :participating_players, source: :player

    accepts_nested_attributes_for :participating_players#, :reject_if => :all_blank, :allow_destroy => true

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
