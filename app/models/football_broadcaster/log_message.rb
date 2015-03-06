# == Schema Information
#
# Table name: football_broadcaster_log_messages
#
#  id           :integer          not null, primary key
#  body         :text
#  minutes      :integer
#  seconds      :integer
#  broadcast_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

module FootballBroadcaster
  class LogMessage < ActiveRecord::Base
    belongs_to :broadcast, class_name: 'FootballBroadcaster::Broadcast'

    default_scope { order('created_at DESC, minutes * 60 + seconds DESC') }

    validates :body, presence: true

    # Minutes and seconds are optional
    # But if one of those is present
    # the other should be present as well
    validates :minutes, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0 },
              if: Proc.new {|log| log.seconds.present?}
    validates :seconds, presence: true,
              numericality: { only_integer: true, greater_than_or_equal_to: 0,
                              less_than: 60 },
              if: Proc.new {|log| log.minutes.present?}

    def match_time
      return unless minutes.present? && seconds.present?
      min = (minutes < 10 ? '0' : '') + minutes.to_s
      sec = (seconds < 10 ? '0' : '') + seconds.to_s
      "#{min}:#{sec}"
    end
  end
end
