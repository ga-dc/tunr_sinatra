require "bundler/setup"
# require "pg"
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/' do
  @artists = Artist.all
  erb :'/artists/index'
end

get '/artists' do
  @artists = Artist.all
  erb :"/artists/index"
end

get '/artists/new' do
  erb :"/artists/new"
end

# inorder to create a new we don't need any data but render erb

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"/artists/show"
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

delete '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect("/artists")
end

get '/songs' do
  erb :'/songs/index'
end

get '/songs' do
  erb :'/songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :"/songs/show"
end

post '/songs' do
  @song = Song.create(params[:artist])
  redirect "/songs/#{@song.id}"
end

delete '/songs/:id' do
  @song = Song.find(params[:id])
  @song.destroy
  redirect("/songs")
end
