defmodule DataloaderSample.Repo do
  use Ecto.Repo,
    otp_app: :dataloader_sample,
    adapter: Ecto.Adapters.SQLite3
end
