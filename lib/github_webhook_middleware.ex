defmodule GithubWebhookMiddleware do
  # module for working with applications and defining application callbacks
  use Application

  def hello do
    :world
  end

  def start(_type, _args) do
    # new syntax as of Elixir 1.5 (no longer use Supervisor.spec)
    children = [
      # use a tuple instead of an atom: to configure children
      GithubWebhookMiddleware.Endpoint
    ]

    # name: name of Supervisor
    # QUESTION: should I be registering a name for the Supervisor
    opts = [strategy: :one_for_one]

    # strategy: options (restart strategies available to Supervisors)
    #  :one_for_one - Only restart the failed child process
    #  :one_for_all - Restart all child processes in event of a failure
    #  :rest_for_one - Restart the failed process and any process started after it
    #  :simple_one_for_one - best for dynamically attached children

    # starts supervisor and children, defining strategy for managing child processes
    # calls child_spec/1 function on given modules
    Supervisor.start_link(children, opts)
  end
end
