class League < ApplicationRecord
  has_many :fantasy_teams
  has_many :users, through: :fantasy_teams
  has_many :commissioners
  has_many :users, through: :commissioners
end
