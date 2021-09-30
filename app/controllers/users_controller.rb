class UsersController < ApplicationController
    def show
        @current_user = find_user
        render json: @current_user
    end

    def create
        @current_user = User.create!(user_params)
        render json: user, status: :created
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.permit(:username,:email)
    end
end
