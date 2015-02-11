# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.create({title: "Team A"})
Team.create({title: "Team B"})

2.times do |i|
  25.times do
    Player.create({name: Faker::Name.first_name, surname: Faker::Name.last_name, team_id: i + 1})
  end
end