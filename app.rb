require "pg"
require "bundler/setup"
require "active_record"
require "pry"

require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end
