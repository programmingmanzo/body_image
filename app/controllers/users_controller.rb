class UsersController < ApplicationController 
    
    get '/login' do #render the login in page 
        erb :login
    end

    post '/login' do #receive the login form, find the user and log the user in (create a session)
        #find the user
        #params looks like: {email: "user@user.com, password: "password"}
        @user = User.find_by(email: params[:email])
        #Authenticate the user - verify the user are who they say they are
        #they the credentials - email/password combo
        if @user.authenticate(params[:password])
            session[:user_id] = @user.id #This is what actually logs the user in

            puts session 
            redirect "users/#{@user.id}"
        else
        end

        #log the user in 
        #redirect to the user's landing page (show? index? dashboard?)
       
    end

    get '/signup' do 
        erb :signup 
    end

    get '/users/:id' do 
        "this will be the user show route"
    end

end