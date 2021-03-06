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
    has_many :log_messages, class_name: 'FootballBroadcaster::LogMessage'

    accepts_nested_attributes_for :participating_players

    validates :title, presence: true
    validates :home_team_id, presence: true
    validates :guest_team_id, presence: true
    validate :guest_team_cannot_be_same_as_home_team
    validate :players_count

    private

    def guest_team_cannot_be_same_as_home_team
      if guest_team == home_team
        errors.add(:guest_team, 'can\'t be the same as the home team.')
      end
    end

    def players_count
      # Delete all reserve players and players from teams that are not participating
      # Then check that guest and home both have 11 field (not reserve players)
      players = participating_players.to_a.delete_if {|p| p.reserve? }.map {
          |p_player| p_player.player
      }.delete_if {
          |player| player.team_id != guest_team_id && player.team_id != home_team_id
      }

      if players.reject {|player| player.team_id == home_team_id }.length != 11
        errors.add(:guest_team, 'must have 11 field players.')
      end

      if players.reject {|player| player.team_id == guest_team_id }.length != 11
        errors.add(:home_team, 'must have 11 field players.')
      end
    end
  end
end
