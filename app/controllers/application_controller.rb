require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "poor password"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else 
    erb :welcome 
    end
  end

  helpers do 

    def logged_in? #true if user is logged in, otherwise false

      !!current_user #(!!)returns a boolean reflection of the truthiness of the object   
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) #Will return nil if there isn't logged in
    end

    def authorized_to_edit?(measurement_entry)
      measurement_entry.user == current_user
    end
    
  end

end
