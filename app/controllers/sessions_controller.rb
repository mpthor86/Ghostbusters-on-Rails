class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Invalid Username or Password"
            redirect_to '/signin'
        end
    end
end
