defmodule RecaptchaAzha.Repo.Migrations.CreateWindows do
  use Ecto.Migration

  def change do
    create table(:windows) do
      add :name, :string
      add :email, :string
      add :subject, :string
      add :body, :text

      timestamps()
    end

  end
end
