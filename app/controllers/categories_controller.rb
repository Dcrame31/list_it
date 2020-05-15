class CategoriesController < ApplicationController


    get '/categories' do
        if logged_in?
            @user = current_user
            erb :'categories/index'
        else
            redirect '/login'
        end
    end

    get '/categories/:id' do
        @category = Category.find(params[:id])
        if logged_in?
            @user = current_user
            erb :'categories/show'
        else
            redirect '/login'
        end
    end

end