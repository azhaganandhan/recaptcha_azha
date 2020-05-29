defmodule RecaptchaAzha.Web.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :body, :string
    field :email, :string
    field :name, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:name, :email, :subject, :body])
    |> validate_required([:name, :email, :subject, :body])
  end
end
