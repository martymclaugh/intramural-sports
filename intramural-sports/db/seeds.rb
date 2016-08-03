# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
  Player.create(name: Faker::Name.name, phone: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, coach: false, password_digest: "123")
end

3.times do
  League.create(sport: ["football", "basketball", "soccer", "hockey"].sample)
end

10.times do
  Team.create(name: Faker::Pokemon.name, league_id: rand(1..3))
end

20.times do
  Game.create(home_score: rand(1..20), away_score: rand(1..20), location: Faker::Address.street_address, date: DateTime.now, home_id: rand(1..10), away_id: rand(1..10))
end

100.times do
  PlayerTeam.create(team_id: rand(1..10), player_id: rand(1..100))
end
