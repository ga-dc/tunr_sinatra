require "bundler/setup"
require "pg"
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
  # binding.pry
  # "hello world"
end

get 'artists/:id' do
  id = params[:id]
  @artists = Artist.find(params[:id])
end
