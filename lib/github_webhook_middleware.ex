defmodule GithubWebhookMiddleware do
  use Application

  def hello do
    :world
  end

  def start(_type, _args) do
    children = []

    opts = [strategy: :one_for_one]

    Supervisor.start_link(children, opts)
  end
end
