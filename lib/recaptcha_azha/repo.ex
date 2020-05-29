defmodule RecaptchaAzha.Repo do
  use Ecto.Repo,
    otp_app: :recaptcha_azha,
    adapter: Ecto.Adapters.Postgres
end
