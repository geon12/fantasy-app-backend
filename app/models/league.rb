class League < ApplicationRecord
  has_many :fantasy_teams, dependent: :destroy
  has_many :users, through: :fantasy_teams
  has_many :commissioners, dependent: :destroy
  has_many :users, through: :commissioners
  has_many :free_agents, dependent: :destroy
  has_many :players, through: :free_agents
end
