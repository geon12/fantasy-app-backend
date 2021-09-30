class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def show
       
        render json: current_user
    end

    def create
        @user = User.create!(user_params)
        render json: @user, status: :created
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:username,:password,:email)
    end
end
