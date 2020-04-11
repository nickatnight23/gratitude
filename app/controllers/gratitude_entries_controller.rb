class GratitudeEntriesController < ApplicationController

  

    get '/gratitude_entries' do
        @gratitude_entries = GratitudeEntry.all
        erb :'gratitude_entries/index'
      end
    
    # get gratitude_entries/ new to render a form to create new entry

    get '/gratitude_entries/new' do

        if !logged_in?
            redirect "/login"
        else
        erb :'/gratitude_entries/new'
    end
end

    # post gratitude_entries to create a new gratitude entry

    post '/gratitude_entries' do
        
        
        # I want to create a new gratitude entry and save it to the DB
        # I also only want to create a gratitude entry if a user is logged in
       
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

        set_gratitude_entry

        erb :'/gratitude_entries/show'

    end

    # This route should send us to edit.erb
    # render an edit form
    get '/gratitude_entries/:id/edit' do  
        set_gratitude_entry
        if logged_in? && authorized_to_edit?(@gratitude_entry)
            erb  :'/gratitude_entries/edit'
        else
            redirect "/users/#{current_user.id}"
        end
    end

    # This action's job is to
    patch '/gratitude_entries/:id' do
        # 1. find gratitude entry
        set_gratitude_entry
        # 2. modify (update) gratitude entry
        if params[:content] != ""
            @gratitude_entry.update(content: params[:content])
        
            # 3. redirect to show page
            redirect "/gratitude_entries/#{@gratitude_entry.id}"
        else  
            redirect "/gratitude_entries/#{@gratitude_entry.id}/edit"
        end 
    end

        delete '/gratitude_entries/:id' do

            set_gratitude_entry
            if authorized_to_edit?(@gratitude_entry)
                @gratitude_entry.destroy
                redirect '/gratitude_entries'
                # delete the entry
                # go some where
            else
                redirect '/gratitude_entries'

            end
        end

    private

    def set_gratitude_entry
     @gratitude_entry = GratitudeEntry.find(params[:id]) 
    end

end
