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
  songs = @artist.songs
  @albums = []
  songs.each do |song|
    if !@albums.include? song.album
      @albums << song.album
    end
  end
  erb :"artists/show"
end

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end
