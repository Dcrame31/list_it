class ListsController < ApplicationController

    get '/lists' do
        @lists = List.all
        if logged_in?
            @user = current_user
            erb :'lists/index'
        else
            redirect '/login'
        end 
    end

    get '/lists/new' do
        if logged_in?
            erb :'lists/new'
        else
            redirect '/login'
        end
    end

    post '/lists' do
        
    end


end