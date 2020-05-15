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
        
        params[:content][:name].each do |name|
            @list.contents << Content.create(name: name) if !name.empty?
        end

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
        @list = List.find(params[:id])
        if logged_in?
            @list.update(params[:list])
            
            params[:content][:name].each do |name|
                @list.contents << Content.create(name: name) if !name.empty?
            end

            if !params[:category][:name].empty?
                @list.categories << Category.create(name: params[:category][:name])
            end
            @list.save
            redirect :"/lists/#{@list.id}"
        else
            redirect '/login'
        end
    end

    get '/lists/:id/delete' do
        @list = List.find(params[:id])
        if logged_in?
            @list.delete
            redirect '/home'
        else
            redirect '/login'
        end
    end

end