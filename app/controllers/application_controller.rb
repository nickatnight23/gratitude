require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "amazing_gratitude_app"
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
    erb :welcome
  end
end

     helpers  do

    def logged_in?
      # true if user is logged in, otherwise false
      !!session[:user_id]
    end

    def current_user

      #reduce the amount of data base calls using an instance variable
      # if it is already called it will not hit the data base again
      @current_user ||= User.find(session[:user_id])
    end

    def authorized_to_edit?(gratitude_entry)
      gratitude_entry.user == current_user

    end
  end
end

