class UserController < ApplicationController

    get '/home' do
        if logged_in?
            @user = current_user
            erb :'users/index'
        else
            redirect '/'
        end
    end

    get '/signup' do
        
    end

    post '/signup' do
        
    end

    get '/login' do
        
    end

    post '/login' do
        
    end

end