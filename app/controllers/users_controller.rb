class UsersController < ApplicationController

    # What routes do I need for login?
    # The purpose of this route is to? Is to render the login page (form)
    get '/login' do
        erb :login

    end

    # What routes do I need for signup?

    get '/signup' do
 end
end