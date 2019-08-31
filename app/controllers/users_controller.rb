class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new
        @user = User.new
    end

    def create
        @user = User.new(name: params[:user][:name], username: params[:user][:username], password: params[:user][:password])
        if params[:user][:password] != params[:user][:password_confirm]
            @user.errors.add(:password, "didn't match confirmation")
            render new_user_path
        elsif @user.valid?
            @user.save
            redirect_to root_path
        else
            render new_user_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.assign_attributes(name: params[:user][:name], username: params[:user][:username], password: params[:user][:password])
        if params[:user][:password] != params[:user][:password_confirm]
            @user.errors.add(:password, "didn't match confirmation")
            render 'users/edit'
        elsif @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
            render 'users/edit'
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to root_path
    end

    private
    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirm)
    end

    def require_login
        unless logged_in?
            redirect_to signin_path, alert: "Must be signed in to access the requested page"
        end
    end
end