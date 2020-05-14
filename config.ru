require './config/environment.rb'


use Rack::MethodOverride
use CategoriesController
use ListsController
use UsersController
run ApplicationController