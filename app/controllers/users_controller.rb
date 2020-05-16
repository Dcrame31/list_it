require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
    enable :sessions
    use Rack::Flash

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
            @user = current_user
            redirect '/home'
        else
            erb :'/users/signup'
        end
    end

    post '/signup' do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password])
        if params[:username] == "" || params[:email] == "" || params[:password] == ""
            redirect '/signup'
        elsif !params[:username].nil?
            flash[:message] = "Username already exists"
            erb :'/users/signup'
        elsif !EmailAddress.valid?(params[:email])
            flash[:message] = "Please enter valid email address"
            erb :'/users/signup'
        elsif @user.save
            session[:user_id] = @user.id
            redirect '/login'
        end
    end

    get '/login' do
        if logged_in?
            @user = current_user
            redirect '/home'
        else
            erb :'users/login'
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])

        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect to '/home'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect '/home'
        end
    end

    get '/users/delete' do
        if logged_in?
            @user = current_user
            erb :'users/delete'
        else
            redirect '/login'
        end
    end

    get '/delete' do    
        if logged_in?
            @user = current_user
            @user.delete
            session.clear
            redirect '/'
        else
            redirect '/login'
        end
    end

end