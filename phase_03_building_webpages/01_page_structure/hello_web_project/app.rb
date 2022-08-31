require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    # The erb method takes the view file name (as a Ruby symbol)
    # and reads its content so it can be sent
    # in the response.
    return erb(:index)
  end

  get "/hello" do
    return erb(:hello)
  end

  # get "/hello" do
  #   name = params[:name]

  #   return "Hello #{name}!"
  # end

  get "/names" do
    return "Julia, Mary, Karim"
  end

  post "/sort-names" do
    names = params[:names]
    return names.split(/\W+/).sort.join(",")
  end
end
