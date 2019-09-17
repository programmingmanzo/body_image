class UserController < ApplicationController 
    
    get '/login' do #render the login in page 
        erb: login
    end

    get '/signup' do 
        erb: signup 
    end

end