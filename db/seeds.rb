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
Commissioner.destroy_all
Player.destroy_all
League.destroy_all
User.destroy_all
#Create Player
for player in player_data
    Player.create({name:player[0], nba_team: player[3], active:true, fppg:player[5],position:player[1]})
end

# #Create Posiitons
# Position.create(name: "Shooting Guard",shorthand:"SG")
# Position.create(name:"Center",shorthand:"C")
# Position.create(name:"Forward",shorthand:"F")
# Position.create(name:"Point Guard",shorthand:"PG")
# Position.create(name:"Small Forward",shorthand:"SF")
# Position.create(name:"Guard",shorthand:"G")
# Position.create(name:"Power Forward",shorthand:"PF")

# #Create Player Posiitons
# for player in player_data
#     PlayerPosition.create(player:Player.find_by(name:player[0]),position:Position.find_by(shorthand:player_data[1]))
# end

#Create Users
10.times do
    User.create(username:Faker::Internet.unique.username, email:Faker::Internet.unique.email,password:"abcd")
end

#Create League
league = League.create(name:"Flatiron League", team_num:10, pf_num:rand(1..2),sf_num:rand(1..2),sg_num:rand(1..2),pg_num:rand(1..2),c_num:rand(1..2),be_num:rand(1..3),util_num:rand(1..2))
#Create Commissioner
Commissioner.create(user:User.first,league:league)
#Create FreeAgents
Player.all.each do |player|
    FreeAgent.create(player:player, league: league)
end
#Create FantasyTeam

def add_players (num,pos,team)
    num.times do
        free_agent = FreeAgent.joins(:player).where('players.position = ?',pos).sample
        TeamPlayer.create(fantasy_team:team,player:free_agent.player,utility:false,bench:false)
        free_agent.destroy
    end
end
User.all.each do |user|
    team = FantasyTeam.create(team_name:Faker::Name.unique.name,user:user,league:league)
    add_players(league.pf_num,'PF',team)
    add_players(league.sf_num,'SF',team)
    add_players(league.sg_num,'SG',team)
    add_players(league.pg_num,'PG',team)
    add_players(league.c_num,'C',team)
    

    league.be_num.times do
        free_agent = FreeAgent.all.sample
        TeamPlayer.create(fantasy_team:team,player:free_agent.player,utility:false,bench:true)
        free_agent.destroy
    end

    league.util_num.times do
        free_agent = FreeAgent.all.sample
        TeamPlayer.create(fantasy_team:team,player:free_agent.player,utility:true,bench:false)
        free_agent.destroy
    end
    # 10.times do
    #     free_agent = FreeAgent.all.sample
    #     TeamPlayer.create(fantasy_team:team,player:free_agent.player)
    #     free_agent.destroy
    # end
end
#Create TeamPlayer
puts("Done seeding")
