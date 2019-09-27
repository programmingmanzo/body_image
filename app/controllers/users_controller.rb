class UsersController < ApplicationController 
    
    get '/login' do #render the login in page 
        erb :login
    end

    post '/login' do #receive the login form, find the user and log the user in (create a session)
        #find the user
        #params looks like: {email: "user@user.com, password: "password"}
        @user = User.find_by(email: params[:email])
        #binding.pry 
        #Authenticate the user - verify the user are who they say they are
        #they the credentials - email/password combo
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id #This is what actually logs the user in
            redirect "users/#{@user.id}"
        else
            flash[:message] = "Your credentials were invalid. Please sign up or login"
            redirect '/login'
        end
    end

    get '/signup' do #renders a signup form
        erb :signup 
    end

    post '/users' do 
        
        if params[:name] != "" && params[:email] != "" && params[:password] != ""
            @user = User.create(params)
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"

        else
            flash[:message] = "Please fill in all fields!!!"
            redirect '/signup'
        end

    end

    get '/users/:id' do 
    
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end
end