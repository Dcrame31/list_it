require './config/environment.rb'


use Rack::MethodOverride
use CategoriesController
use UsersController

run ApplicationController