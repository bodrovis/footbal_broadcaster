require 'faker'

FactoryGirl.define do
  factory :player, class: Player do
    name Faker::Name.first_name
    surname Faker::Name.last_name
    team
  end
end