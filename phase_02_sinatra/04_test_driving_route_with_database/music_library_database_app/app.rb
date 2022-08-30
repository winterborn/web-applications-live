# file: app.rb
require "sinatra"
require "sinatra/reloader"
require_relative "lib/database_connection"
require_relative "lib/album_repository"
require_relative "lib/artist_repository"

DatabaseConnection.connect

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload "lib/album_repository"
    also_reload "lib/artist_repository"
  end

  get "/albums" do
    repo = AlbumRepository.new
    albums = repo.all

    response = albums.map { |album| album.title }.join(", ")

    return response
  end

  post "/albums" do
    repo = AlbumRepository.new
    new_album = Album.new
    new_album.title = params[:title]
    new_album.release_year = params[:release_year]
    new_album.artist_id = params[:artist_id]

    repo.create(new_album)
  end

  get "/artists" do
    repo = ArtistRepository.new
    artists = repo.all

    response = artists.map { |artist| artist.name }.join(", ")

    return response

    # tests make use of music_library_test
    # postmaster requests make use of prod music_library
    # need to clarify with coaches...
  end

  post "/artists" do
    repo = ArtistRepository.new
    new_artist = Artist.new
    new_artist.name = params[:name]
    new_artist.genre = params[:genre]

    repo.create(new_artist)
  end
end
