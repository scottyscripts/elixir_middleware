# ./lib/hello_webhook/endpoint.ex
defmodule GithubWebhookMiddleware.Endpoint do
  # DSL to define routing algorithm that works with plug
  # provides macros to generate routes
  use Plug.Router
  require Logger

  # logs requests
  plug Plug.Logger

  # Plug.Parsers - parse request body given its content type
  # :body_params set to map of params parsed by parsers (:json)
  #   same as Plug.Parsers.JSON
  plug Plug.Parsers, parsers: [:json], json_decoder: Poison
  # find a matching route, then forward to 'dispatch'
  plug :match
  plug :dispatch

  def child_spec(_opts) do
    %{
      id: __MODULE__, # child specification id, defaults to current module
      start: {__MODULE__, :start_link, []}, # how to start the child process
      type: :worker,
      # restart: options (handling child process crashes)
      #  :permanent (default) - child is always restarted
      #  :temporary - child process never restarted
      #  :transient - child process is restarted ONLY IF it terminates abnormally
      restart: :permanent, # when the child should be restarted
      shutdown: 500 # how to shutdown the child
    }
  end

  # used in 'child_spec' method
  def start_link do
    # Runs cowboy under HTTP
    {:ok, _} = Plug.Adapters.Cowboy.http(__MODULE__, [])
  end

  # define GET route for '/hello'
  get "/test" do
    send_resp(conn, 200, "Test is working\n")
  end

  # match for any unspecified routes
  match _ do
    send_resp(conn, 404, "No route defined\n")
  end
end
