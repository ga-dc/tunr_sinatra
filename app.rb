require "bundler/setup" # require all the gems we'll be using for this app from the Gemfile.
require "pg" # postrgres db library
require "active_record" # the ORM
require "pry" # for debugging
require "sinatra"
require "sinatra/reloader"

require_relative "db/connection"
require_relative "models/artist"
require_relative "models/song"
require_relative "controllers/artists_controller.rb"
