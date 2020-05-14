class ListsController < ApplicationController

    get '/lists' do
        if logged_in?
            @user = current_user
            erb :'lists/index'
        else
            redirect '/login'
        end 
    end

    get '/lists/new' do
        if logged_in?
            @user = current_user
            erb :'lists/new'
        else
            redirect '/login'
        end
    end

    post '/lists' do
        @list = List.create(params["list"])

        if !params["category"]["name"].empty?
            @list.categories << Category.create(name: params[:category][:name])
        end
        @list.save

        redirect "/lists/#{@list.id}"
    end

    get '/lists/:id' do
        @list = List.find(params[:id])
        erb :'/lists/show'
    end

    get '/lists/:id/edit' do
        
    end

    patch '/lists/:id' do
        
    end

    delete '/lists/:id' do |variable|
        
    end


end