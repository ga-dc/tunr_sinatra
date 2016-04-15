require "pg"
require "bundler/setup"
require "active_record"
require "pry"

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
  erb :"artists/index"
end

get '/artists' do
  @artists = Artist.all
  erb :"artists/index"
end

get '/artists/new' do
  erb :"artists/new"
end


get '/artists/:id' do
  @artist = Artist.find(params[:id])
  erb :"artists/show"
end

get '/artists/:id/edit' do
  @artist = Artist.find(params[:id])
  erb :"artists/edit"
end

post '/artists' do
  puts params
  @artist = Artist.create(params[:artists])
  redirect "/artists/#{@artist.id}"
end

get "/artists/:id/edit" do
  @artists = Artist.find(params[:id])
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
