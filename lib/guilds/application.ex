defmodule Guilds.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl Application
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      GuildsWeb.Telemetry,
      # Start the Ecto repository
      Guilds.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Guilds.PubSub},
      # Start Finch
      {Finch, name: Guilds.Finch},
      # Start the Endpoint (http/https)
      GuildsWeb.Endpoint
      # Start a worker by calling: Guilds.Worker.start_link(arg)
      # {Guilds.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Guilds.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl Application
  def config_change(changed, _new, removed) do
    GuildsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
