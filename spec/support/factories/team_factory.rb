FactoryGirl.define do
  factory :team, class: FootballBroadcaster.team_class.to_s do
    sequence(:title) { |n| "Team #{n}" }

    factory :team_with_players do
      transient do
        players_count 11
      end

      after :create do |team, evaluator|
        create_list(:player, evaluator.players_count, team: team)
      end
    end
  end
end