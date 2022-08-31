# GET /names Route Design Recipe

_Copy this design recipe template to test-drive a Sinatra route._

## 1. Design the Route Signature

You'll need to include:

- the HTTP method
- the path
- any query parameters (passed in the URL)
- or body parameters (passed in the request body)

---

# Request:

GET /names

# Expected response (2OO OK):

Julia, Mary, Karim

Return names
Method: GET
Path: /names

## 2. Design the Response

The route might return different responses, depending on the result.

For example, a route for a specific blog post (by its ID) might return `200 OK` if the post exists, but `404 Not Found` if the post is not found in the database.

Your response might return plain text, JSON, or HTML code.

_Replace the below with your own design. Think of all the different possible responses your route will return._

When path is `/names` GET response is `Julia, Mary, Karim`

```
Julia, Mary, Karim
```

## 3. Write Examples

_Replace these with your own design._

```
# Request:

GET /names

# Expected response:
Julia, Mary, Karim
```

## 4. Encode as Tests Examples

```ruby
# EXAMPLE
# file: spec/integration/application_spec.rb

require "spec_helper"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }

  context "GET /names" do
    it "returns a list of names 'Julia, Mary, Karim'" do
      response = get("/names")

      expect(response.status).to eq(200)
      expect(response.body).to eq("Julia, Mary, Karim")
    end
  end
end
```

## 5. Implement the Route

Write the route and web server code to implement the route behaviour.
