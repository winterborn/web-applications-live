# Securing User Input

## Intro

You learned how to build forms so user can input data that will be sent to the web
application, as part of the request — which means our web applications can now handle data
filled in by users.

This opens the door to many possibly exciting features, but also to some security risks
for our application.

You can read through [the OWASP list of top ten security risks.](https://owasp.org/www-project-top-ten/)

## Exploiting a breach

Setup the [`unsecure_app`](../projects_to_debug/unsecure_app/) project:

```bash
cd web-applications/projects_to_debug/unsecure_app

bundle install

# Run the server
rackup
```

Navigate to the homepage and copy the following text into the message text field, then submit the form:

```
<script>window.alert("You've been p0wn3d!!!!"); document.location.href="https://www.youtube.com/watch?v=34Ig3X59_qA";</script>
```

OK, that was interesting.

### What happened?

We've input some JavaScript code inside a `<script>` tag, and the next HTML page printed this whole bunch of code without any other check. The JavaScript code did execute (as if it were a normal part of the HTML page), and that code made the browser display an alert message, and redirect to a video.

It's important to know that using this technique, someone clever and motivated enough could exploit a security breach, and get other users' browsers to execute some arbitrary JavaScript code. This could result in stolen credentials, deleted or corrupted data, or worse, depending on the website and the targeted users. This is called _cross-site scripting injection_, or XSS injection.

How do we prevent this? By following one simple rule - **never** trusting user input, and always consider it as "tainted". Before being fully processed (inserted a database, sent to some external service, or displayed to users), it needs to be validated, checked and sanitised.
