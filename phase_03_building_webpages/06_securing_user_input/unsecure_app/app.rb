require "sinatra/base"
require "sinatra/reloader"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    return erb(:index)
  end

  post "/hello" do
    if invalid_request_parameters?
      # Set the response code
      # to 400 (Bad Request) - indicating
      # to the client it sent incorrect data
      # in the request.
      status 400

      return ""
    end

    # Parameters are valid,
    # the rest of the route can execute.

    @name = params[:name]

    return erb(:hello)
  end

  def invalid_request_parameters?
    # Will return true if params[:name] is nil.
    params[:name] == nil ||
      # Will return true if params[:name] contains special character(s).
      !params[:name].scan(/[!@#$%^&*()_+{}\[\]:;'"\/\\?><.,]/).empty?
  end
end
