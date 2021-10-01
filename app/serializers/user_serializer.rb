class UserSerializer < ActiveModel::Serializer
  attributes :username, :email
  has_many :commissioners
  has_many :leagues
  has_many :fantasy_teams
end
