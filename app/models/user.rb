class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :commissioners
    has_many :leagues, through: :commissioners
    has_many :fantasy_teams
    has_many :leagues, through: :fantasy_teams
end
