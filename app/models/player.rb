class Player < ApplicationRecord
    has_many :player_positions
    has_many :positions, through: :player_positions
    has_many :team_players
    has_many :fantasy_teams, through: :team_players
    has_many :free_agents
    has_many :leagues, through: :free_agents
end
