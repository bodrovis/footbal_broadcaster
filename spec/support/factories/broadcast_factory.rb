FactoryGirl.define do
  factory :broadcast, class: FootballBroadcaster::Broadcast do
    sequence(:title) { |n| "Broadcast #{n}" }
    association :home_team, factory: :team
    association :guest_team, factory: :team

    factory :broadcast_with_players do
      transient do
        players [] # Players to add as participating
      end

      before :create do |broadcast, evaluator|
        evaluator.players.each do |player|
          broadcast.participating_players << FactoryGirl.create(:participating_player, player: player, broadcast: broadcast)
        end
      end
    end
  end
end