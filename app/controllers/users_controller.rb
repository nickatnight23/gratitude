class UsersController < ApplicationController

    # What routes do I need for login?
    # The purpose of this route is to? Is to render the login page (form)
    get '/login' do
        erb :login
    end
    # The purpose of this route is to receive the login form, 
    # Find the user, and log the user in(create a session)
    post '/login' do
    # params looks like: {email: "user@user.com", password: "password"}
    # find the user
    @user = User.find_by(email:params[:email])
    # authenticate the user- verify the user is who they say they are
    # They have the credentials email/password
   if @user.authenticate(params[:password])
     # log the user in- create user session
     session[:user_id] = @user.id # logging the user in
    # redirect to the users landing page(show?, index?, dashboard)
    
   else
    # tell the user they entered in invalid credentials
    # redirect to login page
    puts session
    redirect "users/#{@user.id}"
   
    end
end

    # What routes do I need for signup?
    # This routes job is to render the signup form

    get '/signup' do
      # erb (render) a view
      erb :signup
  end

 # users show route

   get '/users/:id' do
    
    "this will be the users show route"
  end
end