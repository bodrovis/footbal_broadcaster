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

require 'rails_helper'

module FootballBroadcaster
  RSpec.describe LogMessage, type: :model do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
