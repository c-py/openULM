defmodule OpenULM.Repo do
  use Ecto.Repo,
    otp_app: :openULM,
    adapter: Ecto.Adapters.Postgres
end
