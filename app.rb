require 'bundler/setup'
require 'active_record'
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

# artist = instructor
# song = student

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/songs' do
  @songs = Song.all
  erb :"songs/index"
end

post '/artists' do
  @artist = Artist.create(params[:artist])
  redirect "/artists/#{@artist.id}"
end

get '/artists/new' do
  erb :"artists/new"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get "/artists/:id/edit" do
  @artist = Artist.find(params[:id])
  erb(:"artists/edit")
end

put '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.update(params[:artist])
  redirect("/artists/#{@artist.id}")
end

delete '/artists/:id' do
  @artist = Artist.find(params[:id])
  @artist.destroy
  erb(:"artists/edit")
  redirect("/artists")
end

get '/artists/:artist_id/song/:id' do
  @artist = Artist.find(params[:artist_id])
  @song = @artist.songs.find(params[:id])

  erb(:"songs/show")
end

# /artists/:artist_id/song/:id
# params[:artist_id]
# parmas[:id]
