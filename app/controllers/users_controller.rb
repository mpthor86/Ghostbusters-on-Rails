class UsersController < ApplicationController
    before_action :redirect_not_logged_in, :valid_user, only: [:show, :edit, :update]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        user.update(user_params)
        redirect_to user_path(user)
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :address)
    end
end
