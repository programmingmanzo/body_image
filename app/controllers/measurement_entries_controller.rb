class MeasurementEntriesController < ApplicationController
    
    get '/measurement_entries' do
        @measurement_entries = MeasurementEntry.all 
        erb :'measurement_entries/index'
    end
    
    get '/measurement_entries/new' do 
        redirect_if_not_logged_in
        erb :'/measurement_entries/new'
    end 

    post '/measurement_entries' do 

        redirect_if_not_logged_in
        
        if  params[:weight] != "" #params[:weight] && params[:waist] && params[:hips] && params[:right_arm] && params[:left_arm] && params[:right_thigh] && params[:left_thigh] != ""
            #raise params.inspect

            
            @measurement_entry = MeasurementEntry.create(weight: params[:weight], user_id:current_user.id, waist: params[:waist], hips: params[:hips], right_arm: params[:right_arm], left_arm: params[:left_arm], right_thigh: params[:right_thigh], left_thigh: params[:left_thigh])
            flash[:method] = "New entry created successfully!"
            redirect "/measurement_entries/#{@measurement_entry.id}"
        else
            #raise params.inspect
            flash[:message] = "Please fill in all fields"
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
            if @measurement_entry.user == current_user && params[:content] != ""
            @measurement_entry.update(weight: params[:weight], user_id: current_user.id, waist: params[:waist], hips: params[:hips], right_arm: params[:right_arm], left_arm: params[:left_arm], right_thigh: params[:right_thigh], left_thigh: params[:left_thigh])
            redirect "/measurement_entries/#{@measurement_entry.id}"
            else
            redirect "/users/#{current_user.id}"
            end 
        else
            redirect '/'
        end 
    end

    delete '/measurement_entries/:id' do 
        set_measurement_entry
        if authorized_to_edit?(@measurement_entry)
            @measurement_entry.destroy
            flash[:message] = "Successfully deleted entry."
            redirect '/measurement_entries'
        else 
            redirect '/measurement_entries'
        end

    end


    private 

    def set_measurement_entry 
        @measurement_entry = MeasurementEntry.find(params[:id])
        #binding.pry 
    end
end


