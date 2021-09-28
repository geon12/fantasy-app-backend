# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

player_data = CSV.read("./bball.csv")
player_data = player_data[1..player_data.length]

puts("Seeding")
TeamPlayer.destroy_all
FreeAgent.destroy_all
FantasyTeam.destroy_all
PlayerPosition.destroy_all
Commissioner.destroy_all
Position.destroy_all
Player.destroy_all
League.destroy_all
User.destroy_all
#Create Player
for player in player_data
    Player.create({name:player[0], nba_team: player[3], active:true, fppg:player[5]})
end

#Create Posiitons
Position.create(name: "Shooting Guard",shorthand:"SG")
Position.create(name:"Center",shorthand:"C")
Position.create(name:"Forward",shorthand:"F")
Position.create(name:"Point Guard",shorthand:"PG")
Position.create(name:"Small Forward",shorthand:"SF")
Position.create(name:"Guard",shorthand:"G")
Position.create(name:"Power Forward",shorthand:"PF")

#Create Player Posiitons

#Create Users

#Create League

#Create Commissioner

#Create FreeAgents

#Create FantasyTeam

#Create TeamPlayer
puts("Done seeding")
