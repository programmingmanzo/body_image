class MeasurementEntriesController < ApplicationController
    get '/measurement_entries/new' do 
        erb :'/measurement_entries/new'
    end 

    post '/measurement_entries' do 

        if !logged_in?
            redirect '/'
        end
        
        if params[:content] != ""
            @measurement_entry = MeasurementEntry.create(content: params[:content], user_id: current_user.id)
            redirect "/measurement_entries/#{@measurement_entry.id}"
        else
            redirect '/measurement_entries/new'
        end

        get '/measurement_entries/:id' do 
            @measurement_entry = MeasurementEntry.find(params[:id])
            erb :'/measurement_entries/show'
        end
    end
end
