class TeamPlayersController < ApplicationController
    #every time you create team player, destroy free agent
    def create
        team_player = TeamPlayer.create!(team_player_params)
        player = team_player.player
        league = team_player.fantasy_team.league
        free_agent = FreeAgent.find_by(player_id:player.id,league_id:league.id)
        free_agent.destroy
        render json: team_player, status: :created
    end
    #every time you destroy team player, create free agent
    def destroy
        team_player = find_team_player
        league = team_player.fantasy_team.league
        FreeAgent.create!(player:team_player.player,league:league)
        player.destroy
        head :no_content
    end

    private

    def find_team_player
        TeamPlayer.find(params[:id])
    end

    def team_player_params
        params.permit(:fantasy_team_id,:player_id,:bench,:utility)
    end
end
