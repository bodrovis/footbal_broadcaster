FactoryGirl.define do
  factory :team, class: FootballBroadcaster.team_class.to_s do
    sequence(:title) { |n| "Team #{n}" }

    trait :with_players do
      association :home_team, factory: :team
    end

    factory :unpublished_post, traits: [:unpublished]
  end
end