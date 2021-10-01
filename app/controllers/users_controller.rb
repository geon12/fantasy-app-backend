class UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def show
       
        render json: current_user
    end

    def create
        @user = User.create!(user_params)
        @token = encode_token({ user_id: @user.id })
        render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
    end

    private

    def find_user
        User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:username,:password,:email)
    end
end
