class UsersController < ApplicationController
    def register
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    def show    
        if session[:user_id].to_s == params[:id]
            @user = User.find(params[:id])
        else 
            message = "You're not allowed to view this page."
            redirect_to root_path, notice: message
        end
    end

    private

    def user_params 
        params.require(:user).permit(:username, :password)
    end
    
end