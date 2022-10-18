defmodule CommunityWrites.Repo do
  use Ecto.Repo,
    otp_app: :community_writes,
    adapter: Ecto.Adapters.Postgres

  use Scrivener, page_size: 1
end
