require './config/environment.rb'


use Rack::MethodOverride
use ContentsController
use CategoriesController
use ListsController
use UsersController
run ApplicationController