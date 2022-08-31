require "spec_helper"
require "rack/test"
require_relative "../../app"

def reset_albums_table
  seed_sql = File.read("spec/seeds/albums_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
  connection.exec(seed_sql)
end

def reset_artists_table
  seed_sql = File.read("spec/seeds/artists_seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "music_library_test" })
  connection.exec(seed_sql)
end

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  before(:each) do
    reset_albums_table
    reset_artists_table
  end

  context "GET /" do
    it "should return an index page" do
      response = get("/")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>This is the index page</h1>"
    end
  end

  context "GET /albums/:id" do
    it "should return a specific album based on given id" do
      response = get("/albums/1")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Doolittle</h1>"
      expect(response.body).to include "<p>Release Year: 1989</p>"
      expect(response.body).to include "<p>Artist: Pixies</p>"
    end
  end

  context "GET /albums" do
    it "should return the list of albums in an html document" do
      response = get("/albums")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Albums:</h1>"

      # '<a href="albums/2">Surfer Rosa<a/>'

      expect(
        response.body
      ).to include "<p>Title: <a href='/albums/2'>Surfer Rosa</a></p>"
      expect(response.body).to include "<p>Release Year: 1988</p>"

      expect(
        response.body
      ).to include "<p>Title: <a href='/albums/7'>Folklore</a></p>"
      expect(response.body).to include "<p>Release Year: 2020</p>"

      expect(
        response.body
      ).to include "<p>Title: <a href='/albums/12'>Ring Ring</a></p>"
      expect(response.body).to include "<p>Release Year: 1973</p>"
    end
  end

  # Simple GET retrieval of list of albums:
  # context "GET /albums" do
  #   it "should return the list of albums" do
  #     response = get("/albums")
  #     expected_string =
  #       "Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring"

  #     expect(response.status).to eq 200
  #     expect(response.body).to eq expected_string
  #   end
  # end

  context "Get /albums/new" do
    it "returns a form to add a new album" do
      response = get("/albums/new")

      expect(response.status).to eq 200
      expect(response.body).to include "<form method='POST' action='/albums'>"
      expect(response.body).to include "<input type='text' name='title'/>"
      expect(
        response.body
      ).to include "<input type='text' name='release_year'/>"
      expect(response.body).to include "<input type='text' name='artist_id'/>"
    end
  end

  context "POST /albums" do
    it "should validate album parameters" do
      response =
        post(
          "/albums",
          invalid_artist_title: "OK Computer",
          another_invalid_thing: 123
        )

      expect(response.status).to eq 400
    end

    it "should create a new album" do
      response =
        post(
          "/albums",
          title: "Lifeforms",
          release_year: "2022",
          artist_id: "8"
        )

      expect(response.status).to eq 200
      expect(response.body).to eq ""

      response = get("/albums")

      expect(response.body).to include "Lifeforms"
    end

    it "should create another new album" do
      response =
        post("/albums", title: "Voyage", release_year: "2022", artist_id: "2")

      expect(response.status).to eq 200
      expect(response.body).to eq ""

      response = get("/albums")

      expect(response.body).to include "Voyage"
    end
  end

  context "GET /artists/:id" do
    it "should return a specific artist based on given id" do
      response = get("/artists/1")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Pixies</h1>"
      expect(response.body).to include "<p>Genre: Rock</p>"
      # expect(response.body).to include "<p>Albums: Wish</p>"
    end
  end

  context "GET /artists" do
    it "should return the list of artists in an html document" do
      response = get("/artists")

      expect(response.status).to eq 200
      expect(response.body).to include "<h1>Artists:</h1>"

      expect(
        response.body
      ).to include "<p>Name: <a href='/artists/1'>Pixies</a></p>"

      expect(
        response.body
      ).to include "<p>Name: <a href='/artists/3'>Taylor Swift</a></p>"

      expect(
        response.body
      ).to include "<p>Name: <a href='/artists/4'>Nina Simone</a></p>"
    end
  end

  # Simple GET retrieval of list of artists:
  # context "GET /artists" do
  #   it "returns 200 OK and a list of artists" do
  #     response = get("/artists")
  #     expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos"

  #     expect(response.status).to eq 200
  #     expect(response.body).to eq expected_response
  #   end
  # end

  context "Get /artists/new" do
    it "returns a form to add a new artist" do
      response = get("/artists/new")

      expect(response.status).to eq 200
      expect(response.body).to include "<form method='POST' action='/artists'>"
      expect(response.body).to include "<input type='text' name='name'/>"
      expect(response.body).to include "<input type='text' name='genre'/>"
    end
  end

  context "POST /artists" do
    it "should validate artist parameters" do
      response =
        post(
          "/artists",
          invalid_album_title: "Invalid Name",
          another_invalid_thing: 123
        )

      expect(response.status).to eq 400
    end

    it "creates a new artist by sending a method call -> sql query to add to database" do
      response = post("/artists", name: "Wild Nothing", genre: "Indie")

      expect(response.status).to eq 200
      expect(response.body).to eq ""

      response = get("/artists")

      expect(response.body).to include "Wild Nothing"
    end
  end
end
