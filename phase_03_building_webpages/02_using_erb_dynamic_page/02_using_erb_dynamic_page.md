# HTML and ERB Responses

## Intro

The HTML content we put in views is static by default.

We can use ERB (for Embedded Ruby) syntax to generate dynamically the HTML that is sent to the client, by replacing the dynamic parts of the HTML, which are delimited by ERB tags (in between `<%=` and `%>`).

The following example shows how a variable `@name` can be used to change the view HTML content:

```ruby
# file: app.rb
require "sinatra/base"

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/hello" do
    # Set an instance variable in the route block.
    @name = params[:name]

    # The process is then the following:
    #
    # 1. Ruby reads the .erb view file
    # 2. It looks for any ERB tags and replaces it by their final value
    # 3. The final generated HTML is sent in the response

    return erb(:index)
  end
end
```

The value of the instance variable is then accessible in the `view` file:

```erb
<!-- file: views/index.erb -->
<html>
  <head></head>
  <body>
    <!-- the ERB tag below will be replaced by the value of @name -->
    <h1>Hello <%= @name %>!</h1>
  </body>
</html>
```
