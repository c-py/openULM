defmodule OpenULM.Repo.Migrations.CreatePeopleGroups do
  use Ecto.Migration

  def change do
    create table(:people_groups, primary_key: false) do
      add(:person_id, references(:people, on_delete: :delete_all), primary_key: true)
      add(:group_id, references(:groups, on_delete: :delete_all), primary_key: true)

      timestamps()
    end

    create index(:people_groups, [:person_id])
    create index(:people_groups, [:group_id])

    create unique_index(:people_groups, [:person_id, :group_id])
  end
end
