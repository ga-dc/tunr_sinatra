require 'bundler/setup'
require 'pg'
require 'pry'
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
  erb :'artists/index'
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/new' do
  erb :'artists/new'
end


get '/artists/:id' do
  @artists = Artist.find(params[:id])
  erb :'artists/show'
end




get '/songs' do
  @songs = Song.all
  erb :'songs/index'
end
