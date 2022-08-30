require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  # Request:
  # GET /?name=David

  get "/hello" do
    name = params[:name] # The value is 'David'

    # Do something with `name`...

    return "Hello #{name}"
  end

  # Request:
  # POST /hello
  #   With body parameter: name=Alice

  post "/hello" do
    name = params[:name] # The value is 'Alice'

    # Do something with `name`...

    return "Hello #{name}"
  end

  # Request:
  # POST /submit
  # With body parameters: name = Leo, message = Hello world

  post "/submit" do
    name = params[:name] # The value is 'Leo'
    message = params[:message] # The value is 'Hello world'

    return "Thanks #{name}, you sent this message: '#{message}'"
  end
end
