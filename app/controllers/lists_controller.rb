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
        @list = List.create(params[:list])

        if !params[:category][:name].empty?
            @list.categories << Category.create(name: params[:category][:name])
        end
        @list.save

        redirect "/lists/#{@list.slug}"
    end

    get '/lists/:slug' do
        @list = List.find_by_slug(params[:slug])
        erb :'/lists/show'
    end

    get '/lists/:slug/edit' do
        
    end

    patch '/lists/:slug' do
        
    end

    delete '/lists/:slug' do |variable|
        
    end


end