class TeamPlayerSerializer < ActiveModel::Serializer
  attributes :id, :fantasy_team_id, :player_id, :bench, :utility
  belongs_to :player
end
