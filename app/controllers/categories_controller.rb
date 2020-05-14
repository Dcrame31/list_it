class CategoryController < ApplicationController

    get '/categories' do
        
    end

    get '/categories' do
        if logged_in?
            @user = current_user
            erb :'categories/index'
        else
            redirect '/login'
        end
    end

end