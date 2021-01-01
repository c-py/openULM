defmodule OpenULM.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :full_name, :string
      add :preferred_name, :string
      add :email, :string

      timestamps()
    end

  end
end
