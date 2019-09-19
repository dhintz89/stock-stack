class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def new
        @user = User.new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user
            if @user.authenticate(params[:user][:password])
                log_in(@user)
                redirect_to root_path
            else
                @user.errors.add(:password, "Invalid")
                render 'sessions/new'
            end
        else
            @user = User.new
            @user.errors.add(:username, "Invalid")
            render 'sessions/new'
        end
    end

    def destroy
        if logged_in?
            session.delete(:user_id)
        end
        redirect_to root_path
    end

    private
    def session_params
        params.require(:user).permit(:username, :password)
    end
end