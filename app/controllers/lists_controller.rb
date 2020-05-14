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
        @categories = Category.all
        if logged_in?
            erb :'lists/new'
        else
            redirect '/login'
        end
    end

    post '/lists' do
        if logged_in?
            
    end

    get '/lists/:slug' do
        
    end

    get '/lists/:slug/edit' do
        
    end

    patch '/lists/:slug' do
        
    end

    delete '/lists/:slug' do |variable|
        
    end


end