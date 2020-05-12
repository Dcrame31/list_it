class UserController < ApplicationController

    get '/home' do
        @lists = List.all
        @categories = Category.all
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
            erb :'users/signup'
        end
    end

    post '/signup' do
        if !params[user].nil?
            @user = User.create(params)
            redirect '/login'
        else
            redirect '/signup'
        end
    end

    get '/login' do
        
    end

    post '/login' do
        
    end

end