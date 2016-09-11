require 'faker'
require "ffaker"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.delete_all
League.delete_all
Team.delete_all
TeamGame.delete_all
PlayerTeam.delete_all

300.times do
  Player.create(name: FFaker::Name.name, phone: FFaker::PhoneNumber.phone_number, email: FFaker::Internet.email, coach: false, password: '123')
end

League.create(sport: "Football")
League.create(sport: "Basketball")
League.create(sport: "Hockey")


20.times do
  Team.create(name: Faker::Pokemon.name, league_id: rand(1..3))
end

30.times do
  Game.create(address: Faker::Address.street_address, time: Time.now, date: Date.new, home_score: rand(1..50), away_score: rand(1..50))
end

60.times do
  TeamGame.create(home_id: rand(1..20), away_id: rand(1..20), game_id: rand(1..60))
end

300.times do
  PlayerTeam.create(team_id: rand(1..20), player_id: rand(1..300))
end
