FactoryGirl.define do
  factory :log_message, class: FootballBroadcaster::LogMessage do
    sequence(:body) { Faker::Hacker.say_something_smart }
    minutes nil
    seconds nil
  end
end