require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require 'pg'
require 'pry'
require 'bundler/setup'

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

post '/artists' do
  @artist = Artist.create(name: params[:name], photo_url: params[:photo_url], nationality: params[:nationality])
  redirect "/artists/#{@artist.id}"
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
  redirect("/artists")
end
