class SessionsController < ApplicationController
    before_action :require_login, only: [:destroy]

    def new
        @user = User.new
    end

    def create
        # can't use has_secure_password and oauth without custom coding - add in future release
        # if params[:user]
        #     @user = User.find_by(username: session_params[:username])
        #     if @user
        #         if @user.authenticate(session_params[:password])
        #             log_in(@user)
        #             redirect_to root_path
        #         else
        #             @user.errors.add(:password, "Invalid")
        #             render 'sessions/new'
        #         end
        #     else
        #         @user = User.new
        #         @user.errors.add(:username, "Invalid")
        #         render 'sessions/new'
        #     end
        # else
            @user = User.find_or_create_by(uid: auth['uid']) do |u|
                u.name = auth['info']['name']
                u.username = auth['info']['email'].split('@')[0]
                u.email = auth['info']['email']
                u.profile_pic = auth['info']['image']
            end
            log_in(@user)
            redirect_to root_path 
        # end
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

    def auth
        request.env['omniauth.auth']
    end
end