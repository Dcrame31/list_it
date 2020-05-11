require_relative './config/environment'


use Rack::MethodOverride
use UserController
use ListController
use CategoryController
run ApplicationController