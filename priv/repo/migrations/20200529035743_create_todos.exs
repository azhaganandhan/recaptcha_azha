defmodule RecaptchaAzha.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :name, :string
      add :email, :string
      add :subject, :string
      add :body, :text

      timestamps()
    end

  end
end
