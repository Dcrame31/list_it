require './config/environment.rb'


use Rack::MethodOverride
use UserController

run ApplicationController