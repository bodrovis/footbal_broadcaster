FactoryGirl.define do
  factory :team, class: FootballBroadcaster.team_class.to_s do
    sequence(:title) { |n| "Team #{n}" }
  end
end