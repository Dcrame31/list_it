class UserController < ApplicationController

    get '/home' do
        if logged_in?
            @user = current_user
            erb :'users/index'
        else
            redirect '/login'
        end
    end

    get '/signup' do
        if logged_in?
            redirect '/home'
        else
            erb :'users/index'
        end
    end

    post '/signup' do
        
    end

    get '/login' do
        
    end

    post '/login' do
        
    end

end