defmodule ResonatingThoughts.Repo do
  use Ecto.Repo,
    otp_app: :resonating_thoughts,
    adapter: Ecto.Adapters.Postgres
end
