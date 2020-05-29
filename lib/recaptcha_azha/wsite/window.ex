defmodule RecaptchaAzha.Wsite.Window do
  use Ecto.Schema
  import Ecto.Changeset

  schema "windows" do
    field :body, :string
    field :email, :string
    field :name, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(window, attrs) do
    window
    |> cast(attrs, [:name, :email, :subject, :body])
    |> validate_required([:name, :email, :subject, :body])
  end
end
