class FreeAgentsController < ApplicationController
    def index
        if params[:league_id]
          league = League.find(params[:league_id])
          free_agents = league.free_agents
        else
          free_agents = FreeAgent.all
        end
        render json: free_agents
    end
end
