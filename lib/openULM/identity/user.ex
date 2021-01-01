defmodule OpenULM.Identity.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :full_name, :string
    field :preferred_name, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:full_name, :preferred_name, :email])
    |> validate_required([:full_name, :preferred_name, :email])
  end
end
