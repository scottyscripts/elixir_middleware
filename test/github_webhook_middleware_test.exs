defmodule GithubWebhookMiddlewareTest do
  use ExUnit.Case
  doctest GithubWebhookMiddleware

  test "greets the world" do
    assert GithubWebhookMiddleware.hello() == :world
  end
end
