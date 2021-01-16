defmodule OpenULM.Directory.PersonGroup do
  use Ecto.Schema

  schema "people_groups" do
    belongs_to :person, OpenULM.Directory.Person
    belongs_to :group, OpenULM.Directory.Group
    timestamps()
  end
end
