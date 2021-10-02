class FantasyTeamsController < ApplicationController
    
    def show
        fantasy_team = find_fantasy_team
        render json: fantasy_team, include: ['team_players','team_players.player','league']
    end

    def update
        fantasy_team = find_fantasy_team
        fantasy_team.update!(fantasy_team_params)
        render json: task
    end

    def create
        fantasy_team = current_user.fantasy_teams.create!(fantasy_team_params)
        render json: fantasy_team, status: :created
    end

    private 

    def find_fantasy_team
        current_user.fantasy_teams.find(params[:id])
    end

    def fantasy_team_params
        params.permit(:team_name,:user_id,:league_id)
    end

end
