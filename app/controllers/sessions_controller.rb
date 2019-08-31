class SessionsController < ApplicationController

    def new
    end

    def create
        @user = User.find_by(username: params[:user][:username])
        if @user
            return head(:forbidden) unless @user.authenticate(params[:user][:password])
            log_in(@user)
            redirect_to root_path
        else
            render 'sessions/new', message: "Invalid Username"
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