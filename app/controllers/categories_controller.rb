class CategoriesController < ApplicationController


    get '/categories' do
        if logged_in?
            @user = current_user
            erb :'categories/index'
        else
            redirect '/login'
        end
    end

    get '/categories/:slug' do
        if logged_in?
            @category = Category.find_by_slug(params[:slug])
            erb :'categories/show'
        else
            redirect '/login'
        end
    end

end