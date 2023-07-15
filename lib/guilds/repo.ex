defmodule Guilds.Repo do
  use Ecto.Repo,
    otp_app: :guilds,
    adapter: Ecto.Adapters.Postgres
end
