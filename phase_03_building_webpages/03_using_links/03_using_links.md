# Using links

## Intro

Let's consider the following situation. We have two routes:

- `GET /` is the "root", returning HTML code — in other words, it is the website homepage.
- `GET /about` is another route, returning some different HTML — it's a different page.

The web browser can send requests to these two routes separately.

However, when building websites, we don't want users to manually enter a new URL every time they need to go to a different page. We need a way to "tell" the browser when to send a new request to a different page.

We use **hypertext links**, or **anchor links** for this. A link is an HTML tag that will be rendered as a hypertext link by the browser, so the user can click on it. This link points to a different URL. When the user clicks, the browser will send a new `GET` request to that URL, and eventually the page will change.

The `<a>` HTML tag is used to create links. The attribute `href` tells the browser which path it should send the next request to, when that link is clicked.

```html
<a href="/about">Go to the about page</a>
```

When the above link is clicked, the browser will send a new request `GET /about` to the server.

## Using the browser developer tools

Most browsers [have integrated developer tools](../pills/use_the_developer_console.md) that we can use to inspect the HTTP requests sent by the browser, and the responses it receives. Learning how to use it can be really helpful when we need to get visibility into what the browser sends and gets back through its HTTP connection with the web server.

When creating links between "pages", keep the developer tools open in the browser, so you can see the HTTP request being logged, and inspect its information.
