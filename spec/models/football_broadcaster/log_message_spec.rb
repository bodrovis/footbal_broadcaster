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
require 'pry-rails'
module FootballBroadcaster
  RSpec.describe LogMessage, type: :model do
    let(:log_message) {FactoryGirl.build(:log_message)}

    it "formats match time properly" do
      log_message.minutes = 1
      log_message.seconds = 2
      expect(log_message.match_time).to eq('01:02')
      log_message.minutes = 100
      log_message.seconds = 34
      expect(log_message.match_time).to eq('100:34')
    end

    context 'validation' do
      it "is not valid without body" do
        log_message.body = nil
        expect(log_message).to_not be_valid
      end

      it "is valid with body and without match time" do
        expect(log_message).to be_valid
      end

      it "is not valid with minutes less than 0" do
        log_message.seconds = 5
        log_message.minutes = -1
        expect(log_message).to_not be_valid
      end

      it "is not valid with seconds less than 0 or greater than 60" do
        log_message.minutes = 5
        log_message.seconds = -1
        expect(log_message).to_not be_valid
        log_message.seconds = 60
        expect(log_message).to_not be_valid
      end

      it "is not valid with seconds but without minutes" do
        log_message.seconds = 10
        expect(log_message).to_not be_valid
      end

      it "is not valid with minutes but without seconds" do
        log_message.minutes = 10
        expect(log_message).to_not be_valid
      end

      it "is not valid with non-numeric minutes or seconds" do
        log_message.minutes = 'b'
        log_message.seconds = 'a'
        expect(log_message).to_not be_valid
      end

      it "is valid with minutes, seconds and body" do
        log_message.minutes = 10
        log_message.seconds = 10
        log_message.body = 'test'
        expect(log_message).to be_valid
      end
    end

    context 'ordering' do
      it "sorts by creation datetime and match time by default" do
        ordering = FootballBroadcaster::LogMessage.default_scoped.order_values
        expect(ordering).to eq(["created_at DESC, minutes * 60 + seconds DESC"])
      end
    end

    context 'associations' do
      it "allows to reference broadcast" do
        expect(log_message).to respond_to(:broadcast)
      end
    end
  end
end
