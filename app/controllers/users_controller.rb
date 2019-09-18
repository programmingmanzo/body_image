class UsersController < ApplicationController 
    
    get '/login' do #render the login in page 
        erb :login
    end

    post '/login' do #receive the login form, find the user and log the user in (create session)

    end

    get '/signup' do 
        erb :signup 
    end

end