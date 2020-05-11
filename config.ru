require_relative './config/environment'


use Rack::MethodOverride
use UserController
run ApplicationController