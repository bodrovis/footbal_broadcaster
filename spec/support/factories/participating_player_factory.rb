require 'faker'

FactoryGirl.define do
  factory :participating_player, class: FootballBroadcaster::ParticipatingPlayer do
    association :broadcast, factory: :broadcast
    association :player, factory: :player
    reserve false

    trait :reserved do
      reserve true
    end

    factory :participating_reserve_player, traits: [:reserved]
  end
end