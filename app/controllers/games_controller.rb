class GamesController < ApplicationController
    def play
        if session[:user_id].nil?
            redirect_to '/'
            return
        end
        if User.find(session[:user_id]).in_progress == 1
            redirect_to '/start'
        else 
            @characters = Character.where(user_id: session[:user_id])
        end
    end

    def start 
        if session[:user_id].nil?
            redirect_to '/'
            return
        end
        @user = User.find(session[:user_id])
        @characters = Character.where(user_id: session[:user_id])
        

        if @characters.count < 2 
            redirect_to '/win'
            @user.in_progress = 0
            @user.save
        else 
            @fighters = @characters.sample(2)
            @user.in_progress = 1
            @user.save
        end
    end

    def absorb(fighter1, fighter2)
        fighter1.exp = fighter1.exp * 2
        fighter1.gold = fighter1.gold + fighter2.gold
        if fighter1.status < 3 
            fighter1.status = fighter1.status + 1
        end
        fighter1.save
        Character.destroy(fighter2.id)
        fighter1.name
    end

    def next 
        @fighter1 = Character.find(params[:fighter1])
        @fighter2 = Character.find(params[:fighter2])
        if session[:user_id] != @fighter1.user_id or session[:user_id] != @fighter2.user_id
            redirect_to '/'
            return
        end
        if @fighter1.status > @fighter2.status 
           message = absorb(@fighter1, @fighter2)
        elsif @fighter1.status < @fighter2.status 
            message = absorb(@fighter2, @fighter1)
        else
            if @fighter1.exp > @fighter2.exp 
                message = absorb(@fighter1, @fighter2)
            elsif @fighter1.exp  < @fighter2.exp  
                message = absorb(@fighter2, @fighter1)
            else
                if @fighter1.gold > @fighter2.gold 
                    message = absorb(@fighter1, @fighter2)
                else
                    message = absorb(@fighter2, @fighter1)
                end
            end
        end

        redirect_to controller: 'games', action: 'start', last_winner: message << " Wins!"
    end

    def win
        @winner = Character.find_by(user_id: session[:user_id])

        if @winner.nil? 
            redirect_to '/'
        else 
            Character.destroy(@winner.id)
        end
    end

    def restart
        if session[:user_id].nil?
            redirect_to '/'
            return
        end
        if !User.find(session[:user_id])
            redirect_to '/'
        else 
            Character.where(user_id: session[:user_id]).destroy_all
        end
        redirect_to '/play'     
    end

    def artifact_info 
        @artifacts = Artifact.all
    end
end