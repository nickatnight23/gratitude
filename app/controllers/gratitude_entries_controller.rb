class GratitudeEntriesController < ApplicationController
    
    # get gratitude_entries/ new to render a form to create new entry
    get '/Gratitude_entries/new' do

        erb :'/gratitude_entries/new'
    end

    # post gratitude_entries to create a new gratitude entry

    post '/Gratitude_entries/gratitude_entries' do
        
        
        # I want to create a new gratitude entry and save it to the DB
        # I also only want to create a gratitude entry if a user is logged in
        if !logged_in?

            redirect '/'
        end
        # I only want to save if it has some content
        if params[:content] !=""
        # create a new entry
        @gratitude_entry = GratitudeEntry.create(content: params[:content],
         user_id: current_user.id)
         redirect "/gratitude_entries/#{@gratitude_entry.id}"

        else
        redirect '/gratitude_entries/new'
        
    end
end

    # show route for gratitude entry
    get '/gratitude_entries/:id' do
        binding.pry

     @gratitude_entry = GratitudeEntry.find(params[:id])

        erb :'/gratitude_entries/show'

    end



    # index route for all gratitude entries
end
