require 'pry'
require 'active_record'

## Connect to the database
require_relative 'db/connection'

# Load models
require_relative 'db/connection'
require_relative 'models/artist'
require_relative 'models/song'

require 'sinatra'
require 'sinatra/reloader'

get '/' do
  erb :"index"
end

get '/artists' do
  @artist = Artist.all
  @targetArtist = {name:" ",photo_url:" ",nationality:" "}
  erb :"artists/index"
end

# Functionality to edit DB of Artists
#Create Artists
post '/create' do
  Artist.create(name:params[:artistName],photo_url:params[:artistPhoto_url],nationality:params[:artistNationality])
  redirect "/artists"
end

post '/delete' do
  Artist.where(:name => params[:artistName]).destroy_all
  redirect "/artists"
end

post '/edit' do
  @targetArtist = Artist.where(:name => params[:artistName].to_s)
  redirect "/artists/#{@targetArtist[0].id.to_s}/edit"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

post '/artists/:id/edit' do
  puts "*"*30
  @artist = Artist.find(params[:id])
  @artist.update(name:params[:artistName], photo_url:params[:artistPhoto_url], nationality:params[:artistNationality])
  redirect "/artists/#{@artist.id.to_s}"
end

#Show songs index
get '/songs' do
  @song = Song.all
  erb :"songs/index"
end

get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get '/songs/:id' do
  @song = Song.find(params[:id])
  @artist = Artist.find(@song.artist)
  erb :"songs/show"
end
