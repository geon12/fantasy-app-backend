class LeaguesController < ApplicationController
    #when you create league, create a commissioner, make all players freeagents

    def index
        leagues = League.all
        render json: leagues
    end

    def create
        league = League.create!(league_params)
        Commissioner.create!(user:current_user,league:league)
        FantasyTeam.create!(team_name:"Commissioner, Name your team!",user:current_user,league:league)
        Player.all.each do |player|
            FreeAgent.create!(player:player,league:league)
        end
        render json: league, status: :created
    end

    def update
        league = find_league
        league.update!(league_params)
        render json: league
    end

    def destroy
        league = find_league
        league.destroy
        head :no_content
    end

    private

    def find_league
        League.find(params[:id])
    end

    def league_params
        params.permit(:id,:name,:pg_num,:pf_num,:sg_num,:sf_num,:c_num,:be_num,:util_num,:team_num)
    end
end
