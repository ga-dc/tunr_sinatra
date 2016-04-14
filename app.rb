require 'bundler/setup'
require 'pg'
require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/' do
  @artists = Artist.all
  @songs = Song.all
  "Indexy"
end

get '/artists/' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist_songs = @artist.songs
  erb :"artists/show"
end

get '/artists/new/' do
  erb :"artists/new"
end

post '/artists/new/' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/:id/edit' do
    @artist = Artist.find(params[:id])
    erb :"artists/edit"
end

put '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  erb :"artists/delete"
end

delete '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect("/artists/")
end


get '/songs/new/' do
  erb :"songs/new"
end

post '/songs/new/' do
  @song = Song.create(params[:song])
  redirect "/songs/#{@song.id}"
end

get '/songs/' do
  @songs = Song.all
  @artists = Artist.all
  erb :"songs/index"
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @artist = Artist.find(@song.artist_id)
  erb :"songs/show"
end
