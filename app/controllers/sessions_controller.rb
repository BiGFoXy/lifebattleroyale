class SessionsController < ApplicationController
    def home
    end

    def login 
        if !session[:user_id].nil?
            redirect_to user_path(session[:user_id])
        end
    end

    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to user_path(@user.id)
        else
            message = "Incorrect password or login."
            redirect_to login_path, notice: message
        end
    end

    def destroy 
        if !@user
            session[:user_id] = nil
            redirect_to root_path
        else
            message = "Couldn't log out."
            redirect_to login_path, notice: message
        end
    end

end