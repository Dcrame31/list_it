require 'sinatra/base'
require 'rack-flash'

class UsersController < ApplicationController
    enable :sessions
    use Rack::Flash

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
        else
            @user.save
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
            flash[:message] = "You are now logged in"
            redirect to '/home'
        elsif !User.all.include?(params[:username])
            flash[:notice] = "Username does not exist"
            redirect '/'
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

end