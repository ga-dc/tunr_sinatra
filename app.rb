require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'

get '/artists/:id/delete' do
  @artist = Artist.find(params[:id])
  erb :"artists/destroy"
end

delete '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.destroy
  redirect "/artists"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

put '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect "/artists/" + @artist.id.to_s
end

get '/artists/add_artist' do
  @artists = Artist.all
  erb :"artists/add_artist"
end

post '/add_artist' do
  Artist.create(name: params[:name], photo_url: params[:photo_url], nationality: params[:nationality])
  redirect "/artists"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  @songs = @artist.songs
  @albums = []
  erb :"artists/show"
end

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end


get '/songs/:id/delete' do
  @song = Song.find(params[:id])
  erb :"songs/destroy"
end

delete '/songs/:id' do
  @song = Song.find(params[:id])
  @song.destroy
  redirect "/songs"
end


put '/songs/:id' do
  @song = Song.find(params[:id])
  @song.update(params[:song])
  redirect "/songs/" + @song.id.to_s
end

get '/songs/:id/edit' do
  @song = Song.find(params[:id])
  @def_artist = @song.artist
  @artists = Artist.all
  erb :"songs/edit"
end


get '/songs/add_song' do
  @artists = Artist.all
  erb :"songs/add_song"
end

post '/songs/add_song' do
  Song.create(title: params[:title], album: params[:album], preview_url: params[:preview_url], artist_id: params[:artist_id])
  redirect "/songs"
end


get '/songs/:id' do
  @song = Song.find(params[:id])
  @artist = @song.artist
  erb :"songs/show"
end

get '/songs' do
  @artists = Artist.all
  @songs = Song.all
  erb :"songs/index"
end
