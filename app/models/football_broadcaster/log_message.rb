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

    default_scope { order('created_at DESC, minutes + seconds DESC') }

    def match_time
      return unless minutes.present? && seconds.present?
      min = (minutes < 10 ? '0' : '') + minutes.to_s
      sec = (seconds < 10 ? '0' : '') + seconds.to_s
      "#{min}:#{sec}"
    end
  end
end
