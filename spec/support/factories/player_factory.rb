require 'faker'

FactoryGirl.define do
  factory :player, class: Player do
    sequence(:name) { Faker::Name.first_name }
    sequence(:surname) { Faker::Name.last_name }
    team
  end
end