class GratitudeEntriesController < ApplicationController
    
    # get gratitude_entries/ new to render a form to create new entry
    get '/Gratitude_entries/new' do

        erb :'/gratitude_entries/new'
    end

    # post gratitude_entries to create a new gratitude entry

    post '/gratitude_entries' do
        
    end

    # show route for gratitude entry

    # index route for all gratitude entries
end