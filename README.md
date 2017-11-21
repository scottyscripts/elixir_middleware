# Github WebHook Middleware

## What Is This For?
This is a server built with Elixir, to act as middleware for webhooks coming from
Github. This server will filter out incoming payloads from webhooks and relay
wanted notifications to our Slack channel

### Tech Used
- [Elixir 1.5](https://hexdocs.pm/elixir/Kernel.html)
- Dependencies
  - [cowboy, "~> 1.1"](https://hex.pm/packages/cowboy)
  - [poison, "~> 3.1"](https://hex.pm/packages/poison)
  - [plug, "~> 1.4"](https://hex.pm/packages/plug)

### How it works
Currently, this server can only be run locally.

To start server locally on port 4000, in your terminal, run:
```
iex -S mix
```

Currently there is one route defined for GET request to '/test'.
Once the server is running locally, you can test this route in another terminal
window with a curl script.

```
curl "http://localhost:4000/test"
```

The output in your terminal should be a message `Test is working`

Making a request to any other route will return a message `No route defined`
