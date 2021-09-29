class FantasyTeam < ApplicationRecord
  belongs_to :user
  belongs_to :league
  has_many :team_players
  has_many :players, through: :team_players
end
