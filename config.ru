require './config/environment.rb'


use Rack::MethodOverride
use UsersController

run ApplicationController