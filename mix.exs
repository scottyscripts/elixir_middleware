defmodule GithubWebhookMiddleware.Mixfile do
  use Mix.Project

  # public function returns project configuration
  def project do
    [
      # required for github_webhook_middleware.app
      app: :github_webhook_middleware,
      # required for github_webhook_middleware.app
      version: "0.1.0",
      elixir: "~> 1.5",
      # starts application in permanent mode, Erlang VM will crash if app's
      #   supervision tree shuts down
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # public function generates an 'application' file
  # Run "mix help compile.app" to learn about applications
  # .app files expect other options (:modules, :vsn) - automatically added by Mix
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # Erlang/Elixir applications you want started before your application
      # start Elixir's logger before this application
      extra_applications: [:logger],
      # specify module to invoke when application started
      # mod: {Mod, args} => args often empty
      # module specified must implement callbacks defined by Application module
      mod: {GithubWebhookMiddleware, []},

      # name of all registered process in application
      # registered: [MyServer],

      # default values for application environment
      # env: [key: :value],

      # applications: applications dependent on at run time, automatically inferred from dependencies

      # start_phases: list of phases & arguments to be called after application started

      # included_applications: specifies list of applications to be included
      # primary applicaton starts supervision tree of all included
      # processes in included applications belongs to primary application
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  # invoked from 'project' function, defines project's dependencies
  # definining deps as function helps seperate concerns
  defp deps do
    [
      {:cowboy, "~> 2.1"},
      {:poison, "~> 3.1"},
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
