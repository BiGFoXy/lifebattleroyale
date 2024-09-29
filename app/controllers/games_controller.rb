class GamesController < ApplicationController
    def play
        if session[:user_id].nil?
            redirect_to '/'
            return
        end
        @user = User.find(session[:user_id])
        if @user.in_progress == 1
            redirect_to '/start'
        else
            @characters = Character.where(user_id: @user.id)
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
            session[:fighter1] = nil
            session[:fighter2] = nil
            redirect_to '/win'
            @user.in_progress = 0
            @user.save
        else 
            @fighters = @characters.sample(2)
            session[:fighter1] = @fighters[0].id
            session[:fighter2] = @fighters[1].id
            @user.in_progress = 1
            @user.save
        end

        @winstreak = @characters.where(winstreak: @characters.maximum(:winstreak))[0]
    end

    def absorb(fighter1, fighter2)
        fighter1.exp = fighter1.exp * 2
        fighter1.gold = fighter1.gold + fighter2.gold
        if fighter1.status < 3 
            fighter1.status = fighter1.status + 1
        end
        fighter1.winstreak = fighter1.winstreak + 1
        fighter1.save
        Character.destroy(fighter2.id)
        fighter1.name
    end

    def next 
        @fighter1 = Character.find(session[:fighter1])
        @fighter2 = Character.find(session[:fighter2])
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