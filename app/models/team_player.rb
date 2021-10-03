class TeamPlayer < ApplicationRecord
  
  belongs_to :fantasy_team
  belongs_to :player

  # validate :must_have_less_than_roster_max
  # def check_roster
  #   ['PF','SF','SG','PG','F','C','G']
  #   .joins(:player).where('players.position = ? ','PF')
  # end

  # def must_have_less_than_roster_max
  #   errors.add(:team_player, "You can't add more players to that position") if check_roster
  # end
end

