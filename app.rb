require 'bundler/setup'
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pry'

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
  erb :'/artists/new'
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"/artists/show"
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/songs/new' do
  erb :'/songs/new'
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  erb :'/songs/show'
end

post '/songs' do
  @song = Song.create(params[:song])
  redirect "/songs/#{@song.id}"
end
