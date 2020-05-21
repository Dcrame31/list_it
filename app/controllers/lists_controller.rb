require 'sinatra/base'
require 'rack-flash'

class ListsController < ApplicationController
    enable :sessions
    use Rack::Flash

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
        @list = List.new(params["list"])
        @user = current_user
        
        if !!@user.lists.find_by(name:@list.name)
            flash[:message] = "List already exists"
            redirect 'lists/new'
        else
            @list.save
        end

        @user.lists << @list
        
        params[:content][:name].each do |name|
            @list.contents << Content.create(name: name) if !name.empty?
        end

        if !params["category"]["name"].empty?
            @list.categories << Category.find_or_create_by(name: params[:category][:name])
            
        end
        @list.save
        flash[:message] = "Successfully created list"
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
            @list.update(name: params[:list][:name])

            @list.contents.clear 
            
            params[:content][:name].each do |name|
                @list.contents << Content.create(name: name) if !name.empty?
            end

            @list.categories.clear

            if !params[:category][:name].empty?
                @list.categories << Category.find_or_create_by(name: params[:category][:name])
            end

            if !params[:categories].nil?
                @categories = Category.all.find(params[:categories])
                @list.categories << @categories
            end

            @list.save

            flash[:message] = "Successfully updated list"

            redirect :"/lists/#{@list.id}"
        else
            redirect '/login'
        end
    end

    get '/lists/:id/delete' do
        @list = List.find(params[:id])
        if logged_in?
            @list.delete
            flash[:message] = "Successfully deleted list"
            redirect '/home'
        else
            redirect '/login'
        end
    end

end
