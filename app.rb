require "bundler/setup"
require "pg"
require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection'

# Load models
require_relative 'models/artist'
require_relative 'models/song'


get '/tunr/:table' do
	@songs = Song.all
	@artists = Artist.all
	@table = params[:table]
	if @table == "artists"
		erb :"artists/index"
	else
		erb :"songs/index"
	end
end

# require "bundler/setup"
# require "pg"
# require 'sinatra'
# require 'sinatra/reloader'
# require 'active_record'

# # Load the file to connect to the DB
# require_relative 'db/connection'

# # Load models
# require_relative 'models/artist'
# require_relative 'models/song'

# get '/artists' do
#  @artists = Artist.all
#  erb :"artists/index"
# end

# get '/artists/:id' do
#  # id = params[:id]
#  @artist = Artist.find(params[:id])
#  erb :"artists/show"
# end

# # get '/artists' do
# #   @artists = Artist.all
# #   erb :"artists/index"
# # end