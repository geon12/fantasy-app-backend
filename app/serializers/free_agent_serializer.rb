class FreeAgentSerializer < ActiveModel::Serializer
  attributes :id, :league_id, :player_id
  belongs_to :player
end
