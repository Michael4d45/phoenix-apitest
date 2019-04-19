defmodule Apitest.Repo do
  use Ecto.Repo,
    otp_app: :apitest,
    adapter: Ecto.Adapters.Postgres
end
