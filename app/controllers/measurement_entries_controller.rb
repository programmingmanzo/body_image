class MeasurementEntriesController < ApplicationController
    
    get '/measurement_entries' do
        @measurement_entries = MeasurementEntry.all 
        erb :'measurement_entries/index'
    end
    
    get '/measurement_entries/new' do 
        erb :'/measurement_entries/new'
    end 

    post '/measurement_entries' do 

        if !logged_in?
            redirect '/'
        end
        
        if params[:content] != ""
            @measurement_entry = MeasurementEntry.create(weight: params[:content], user_id:current_user.id)
            #binding.pry
            redirect "/measurement_entries/#{@measurement_entry.id}"
        else
            redirect '/measurement_entries/new'
        end
    end

    get '/measurement_entries/:id' do 
        set_measurement_entry
        #binding.pry 
        erb :'/measurement_entries/show'
    end

    get '/measurement_entries/:id/edit' do 
        set_measurement_entry
        if logged_in?
            if authorized_to_edit?(@measurement_entry)
                erb :'/measurement_entries/edit'
            else 
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    patch '/measurement_entries/:id' do
        set_measurement_entry
        if logged_in?
            if @measurement_entry.user == current_user
            @measurement_entry.update(weight: params[:content])
            redirect "/measurement_entries/#{@measurement_entry.id}"
            else
            redirect "/users/#{current_user.id}"
            end 
        else
            redirect '/'
        end 
    end

    private 

    def set_measurement_entry 
        @measurement_entry = MeasurementEntry.find(params[:id])
    end
end
