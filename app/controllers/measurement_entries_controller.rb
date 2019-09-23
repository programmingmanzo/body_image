class MeasurementEntriesController < ApplicationController
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
        @measurement_entry = MeasurementEntry.find(params[:id])
        erb :'/measurement_entries/show'
    end

    get '/measurement_entries/:id/edit' do 
        erb :'/measurement_entries/edit'
    end
end
