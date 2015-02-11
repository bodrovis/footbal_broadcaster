FactoryGirl.define do
  factory :broadcast, class: FootballBroadcaster::Broadcast do
    sequence(:title) { |n| "Broadcast #{n}" }
    association :home_team, factory: :team
    association :guest_team, factory: :team
  end
end