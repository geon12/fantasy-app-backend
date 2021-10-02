class FantasyTeamSerializer < ActiveModel::Serializer
  attributes :id, :team_name, :league_id, :user_id
  has_many :team_players
end
