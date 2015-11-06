

get "/artists" do
  @artists = Artist.all
  erb :"artists/index"
end


get "/artists/new" do
  erb :"artists/form"
end

# show id in url when you click on the artist
get "/artists/:id" do
  @artists = Artist.find(params[:id])
  erb  :"artists/display"
end

get "/songs" do
  @songs = Song.all
  erb :"songs/index"
end

get "/songs/:id" do
  @songs = Song.find(params[:id])
  erb  :"songs/display"
end
