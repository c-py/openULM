defmodule OpenULM.Directory.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :email, :string
    field :full_name, :string
    field :preferred_name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:full_name, :preferred_name, :email])
    |> validate_required([:full_name, :preferred_name, :email])
  end
end
