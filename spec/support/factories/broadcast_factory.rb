FactoryGirl.define do
  factory :broadcast, class: FootballBroadcaster::Broadcast do
    sequence(:title) { |n| "Broadcast #{n}" }
    association :home_team, factory: :team
    association :guest_team, factory: :team

    factory :broadcast_with_players do
      transient do
        players [] # Players to add as participating
        reserves [] # Reserve players
      end

      before :create do |broadcast, evaluator|
        # Create participating players via field players
        # DO NOT use participating_players directly like
        # broadcast.participating_players << FactoryGirl.create(:participaring_player, player: player, broadcast: broadcast)
        # in cycle as it causes LOADS of the same validations to be run at each iteration
        # for the broadcast
        broadcast.field_players = evaluator.players
      end
    end
  end
end