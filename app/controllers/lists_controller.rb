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
        @user = current_user
        @user.lists << @list
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
        @list = List.find(params[:id])
        if logged_in?
            @user = current_user
            erb :'lists/edit'
        else
            redirect '/login'
        end
    end

    patch '/lists/:id' do
        
    end

    get '/lists/:id/delete' do
    end

    delete '/lists/:id' do |variable|
        
    end


end