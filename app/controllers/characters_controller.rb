class CharactersController < ApplicationController
    def create
        if session[:user_id].nil?
            redirect_to '/'
            return
        end
        @user = User.find(session[:user_id])

        first_names = [ "Aaren" , "Aarika" , "Abagael" , "Abagail" , "Abbe" , "Abbey" , "Abbi" , "Abbie" , "Abby" , "Abbye" , "Abigael" , "Abigail" , "Abigale" , "Abra" , "Ada" , "Adah" , "Adaline" , "Adan" , "Adara" , "Adda" , "Addi" , "Addia" , "Addie" , "Addy" , "Adel" , "Adela" , "Adelaida" , "Adelaide" , "Adele" , "Adelheid" , "Adelice" , "Adelina" , "Adelind" , "Adeline" , "Adella" , "Adelle" , "Adena" , "Adey" , "Adi" , "Adiana" , "Adina" , "Adora" , "Adore" , "Adoree" , "Adorne" , "Adrea" , "Adria" , "Adriaens" , "Adrian" , "Adriana" , "Adriane" , "Adrianna" , "Adrianne" , "Adriena" , "Adrienne" , "Aeriel" , "Aeriela" , "Aeriell" , "Afton" , "Ag" , "Agace" , "Agata" , "Agatha" , "Agathe" , "Aggi" , "Aggie" , "Aggy" , "Agna" , "Agnella" , "Agnes" , "Agnese" , "Agnesse" , "Agneta" , "Agnola" , "Agretha" , "Aida" , "Aidan" , "Aigneis" , "Aila" , "Aile" , "Ailee" , "Aileen" , "Ailene" , "Ailey" , "Aili" , "Ailina" , "Ailis" , "Ailsun" , "Ailyn" , "Aime" , "Aimee" , "Aimil" , "Aindrea" , "Ainslee" , "Ainsley" , "Ainslie" , "Ajay" , "Alaine" , "Alameda" , "Alana" , "Alanah" , "Alane" , "Alanna" , "Alayne" , "Alberta" , "Albertina" , "Albertine" , "Albina" , "Alecia" , "Aleda" , "Aleece" , "Aleen" , "Alejandra" , "Alejandrina" , "Alena" , "Alene" , "Alessandra" , "Aleta" , "Alethea" , "Alex" , "Alexa" , "Alexandra" , "Alexandrina" , "Alexi" , "Alexia" , "Alexina" , "Alexine" , "Alexis" , "Alfi" , "Alfie" , "Alfreda" , "Alfy" , "Ali" , "Alia" , "Alica" , "Alice" , "Alicea" , "Alicia" , "Alida" , "Alidia" , "Alie" , "Alika" , "Alikee" , "Alina" , "Aline" , "Alis" , "Alisa" , "Alisha" , "Alison" , "Alissa" , "Alisun" , "Alix" , "Aliza" , "Alla" , "Alleen" , "Allegra" , "Allene" , "Alli" , "Allianora" , "Allie" , "Allina" , "Allis" , "Allison" , "Allissa" , "Allix" , "Allsun" , "Allx" , "Ally" , "Allyce" , "Allyn" , "Allys" , "Allyson" , "Alma" , "Almeda" , "Almeria" , "Almeta" , "Almira" , "Almire" , "Aloise" , "Aloisia" , "Aloysia" , "Alta" , "Althea" , "Alvera" , "Alverta" , "Alvina" , "Alvinia"]
        last_names = ["Dollie" , "Dolly" , "Dolores" , "Dolorita" , "Doloritas" , "Domeniga" , "Dominga" , "Domini" , "Dominica" , "Dominique" , "Dona" , "Donella" , "Donelle" , "Donetta" , "Donia" , "Donica" , "Donielle" , "Donna" , "Donnamarie" , "Donni" , "Donnie" , "Donny" , "Dora" , "Doralia" , "Doralin" , "Doralyn" , "Doralynn" , "Doralynne" , "Dore" , "Doreen" , "Dorelia" , "Dorella" , "Dorelle" , "Dorena" , "Dorene" , "Doretta" , "Dorette" , "Dorey" , "Dori" , "Doria" , "Dorian" , "Dorice" , "Dorie" , "Dorine" , "Doris" , "Dorisa" , "Dorise" , "Dorita" , "Doro" , "Dorolice" , "Dorolisa" , "Dorotea" , "Doroteya" , "Dorothea" , "Dorothee" , "Dorothy" , "Dorree" , "Dorri" , "Dorrie" , "Dorris" , "Dorry" , "Dorthea" , "Dorthy" , "Dory" , "Dosi" , "Dot" , "Doti" , "Dotti" , "Dottie" , "Dotty" , "Dre" , "Dreddy" , "Dredi" , "Drona" , "Dru" , "Druci" , "Drucie" , "Drucill" , "Drucy" , "Drusi" , "Drusie" , "Drusilla" , "Drusy" , "Dulce" , "Dulcea" , "Dulci" , "Dulcia" , "Dulciana" , "Dulcie" , "Dulcine" , "Dulcinea" , "Dulcy" , "Dulsea" , "Dusty" , "Dyan" , "Dyana" , "Dyane" , "Dyann" , "Dyanna" , "Dyanne" , "Dyna" , "Dynah" , "Eachelle" , "Eada" , "Eadie" , "Eadith" , "Ealasaid" , "Eartha" , "Easter" , "Eba" , "Ebba" , "Ebonee" , "Ebony" , "Eda" , "Eddi" , "Eddie" , "Eddy" , "Ede" , "Edee" , "Edeline" , "Eden" , "Edi" , "Edie" , "Edin" , "Edita" , "Edith" , "Editha" , "Edithe" , "Ediva" , "Edna" , "Edwina" , "Edy" , "Edyth" , "Edythe" , "Effie" , "Eileen" , "Eilis" , "Eimile" , "Eirena" , "Ekaterina" , "Elaina" , "Elaine" , "Elana" , "Elane" , "Elayne" , "Elberta" , "Elbertina" , "Elbertine" , "Eleanor" , "Eleanora" , "Eleanore" , "Electra" , "Eleen" , "Elena" , "Elene" , "Eleni" , "Elenore" , "Eleonora" , "Eleonore" , "Elfie" , "Elfreda" , "Elfrida" , "Elfrieda" , "Elga" , "Elianora" , "Elianore" , "Elicia" , "Elie" , "Elinor" , "Elinore" , "Elisa" , "Elisabet" , "Elisabeth" , "Elisabetta" , "Elise" , "Elisha" , "Elissa" , "Elita" , "Eliza" , "Elizabet" , "Elizabeth" , "Elka" , "Elke" , "Ella" , "Elladine" , "Elle" , "Ellen" , "Ellene" , "Ellette" , "Elli" , "Ellie" , "Ellissa" , "Elly" , "Ellyn" , "Ellynn" , "Elmira" , "Elna" , "Elnora" , "Elnore" , "Eloisa" , "Eloise" , "Elonore" , "Elora" , "Elsa" , "Elsbeth" , "Else" , "Elset" , "Elsey" , "Elsi" , "Elsie" , "Elsinore" , "Elspeth" , "Elsy" , "Elva" , "Elvera" , "Elvina" , "Elvira" , "Elwira" , "Elyn" , "Elyse" , "Elysee" , "Elysha" , "Elysia" , "Elyssa" , "Em" , "Ema" , "Emalee" , "Emalia" , "Emelda"]
        position = rand(3)+1
        experience = rand(100)
        money = rand(1000)
        @character = @user.characters.create(name: first_names.sample() << " " << last_names.sample(), status: position, exp: experience, gold: money)
        for i in 1..(rand(5)) do  
            @character.inventories.create(artifact_id: rand(3)+1)
        end
        @character.inventories.each do |inventory| 
            if inventory.artifact_id == 1 
                @character.gold = @character.gold * 2
            elsif inventory.artifact_id == 2
                if @character.status < 3 
                    @character.status = @character.status + 1
                end
            else
                @character.exp = @character.exp * 2
            end
        end
        @character.save

        redirect_to '/play'
    end
end