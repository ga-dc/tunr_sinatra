require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load specific routes / controllers
# connects to seperate controller to keep things clean
require_relative 'artists_controller.rb'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get "/" do
erb :"home/index"
end
