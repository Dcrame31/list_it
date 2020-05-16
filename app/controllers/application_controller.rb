require './config/environment'

class ApplicationController < Sinatra::Base

    configure do
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "password_security"
    end

    get '/' do
        if logged_in?
            @user = current_user
            redirect '/home'
        else
            erb :index
        end
    end

    helpers do
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end

end