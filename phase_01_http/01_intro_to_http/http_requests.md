HTTP
Web clients and servers need to communicate through the network. They use a special language called the HTTP protocol.

As web application developers, you'll almost never have to write any HTTP directly, but it's still important to understand the basics of how it works to effectively build and debug web applications. You'll learn more about HTTP in the following sections.

At a high-level, when a client needs to interact with the program, it sends a request to the server through the Internet. When the server program receives this request, it does some work, perhaps communicate with a database behind the scenes, and then sends back a response to the client.

This process is repeated as many times needed, depending on what the application does. Here is an example of a typical HTTP request-response flow for a news website:

The client (a web browser) sends a request to get all latest articles.
The server (a program, written in Ruby or something else) receives the request.
The server retrieves the articles from the database and sends back a response containing the articles' data.
The client receives the response and displays the list of articles.
(end of the first request-response cycle)
The client sends a request to get a specific article.
The server receives the request.
The server retrieves this specific article from the database and sends back a response containing that article's data.
The client receives the response and displays that article's content.
(end of the second request-response cycle)
You can notice that there are some similarities with the type of operations you implemented when working with databases — the client can request all articles, one specific article... and we could probably imagine other operations.

Most web applications you will work on and use will be CRUD applications.
