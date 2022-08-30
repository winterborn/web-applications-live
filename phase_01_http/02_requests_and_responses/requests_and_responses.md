# Requests and Responses

## Request

An HTTP request is essentially defined by:

- its **method** (also called "verb")
- its **path** - is all that follows the first `/` of the URL.
- its **parameters** (or request data)

A web server only responds to a list of requests with specific methods and paths. The developer of the web server program needs to explicitly configure this in their code.

If the web server is not configured to handle a request with a given method and path, it will usually return an error indicating this request cannot be handled.

Once the server receives the request, it does some work (and usually interacts with the database), and sends back a response.

## Response

The HTTP response sent back to the client is essentially defined by:

- its **status code** indicating the result of the operation (status or failure).
- its **body** (or content)

The web server decides which status code to assign to the response, as a way of communicating to the client whether everything is fine (`200` - "OK"), or if something wrong happened. [A lot of different status codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status) exist for different situations. A famous one you probably already know of is `404` ("Not Found"), used by the server to indicate that the server cannot respond to a request.
