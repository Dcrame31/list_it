class UserController < ApplicationController

    get '/home' do
        if logged_in?
            erb :'users/index'
        else
            redirect '/'
        end
    end
end