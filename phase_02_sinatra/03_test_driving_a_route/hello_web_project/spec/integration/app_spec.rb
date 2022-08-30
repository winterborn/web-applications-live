# file: spec/integration/application_spec.rb

require "spec_helper"
require "rack/test"
require_relative "../../app"

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /hello" do
    it "returns 'Hello Phil!'" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/hello?name=Phil")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Phil!")
    end

    it "returns 'Hello Kat!'" do
      # Send a GET request to /
      # and returns a response object we can test.
      response = get("/hello?name=Kat")

      # Assert the response status code and body.
      expect(response.status).to eq(200)
      expect(response.body).to eq("Hello Kat!")
    end
  end

  context "GET /names" do
    it "returns a list of names 'Julia, Mary, Karim'" do
      response = get("/names")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end

  context "POST /sort-names" do
    it "returns an alphabetized list of names as a comma-separated string'" do
      # Send a POST request to /sort-names
      # with some body parameters
      # and returns a response object we can test.
      response = post("/sort-names", names: "Joe,Alice,Zoe,Julia,Kieran")

      expect(response.status).to eq 200
      expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
    end
  end
end
