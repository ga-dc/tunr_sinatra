#Index (index all artists)
get "/" do
  erb :"home"
end

get "/artists" do

  @artists = Artist.all
  erb :"artists/index"

end

# Show (show particular artist)

get "/artist/:id" do
  @artist_id = Artist.find(params[:id])
  erb :"artists/show"
end

# New (render form to create new artists)

get "/artists/new" do
    erb :"artists/new"
end

# Edit (render form to edit existing artist)

get "/artists/:id/edit" do
  Artist.find([:id])
end

# Create (submit form to create new artist)

post "/artists" do
  @name = params[:name]
  @nationality = params[:nationality]
  @photo_url = params[:photo_url]
  new_artist = Artist.create(name: @name, nationality: @nationality, photo_url: @photo_url)
  redirect '/artists'
end

# Update (submit form to update existing artist)

put "/artists/:id" do
  @artist = Artist.find(params[:id])
  @artist.update(name: @name, nationality: @nationality, photo_url: @photo_url)
  erb :"artists/:id"
end

# Destroy (delete an existing artist)

delete "/artists/:id" do

end
