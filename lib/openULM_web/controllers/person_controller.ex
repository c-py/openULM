defmodule OpenULMWeb.PersonController do
  use OpenULMWeb, :controller

  alias OpenULM.Directory
  alias OpenULM.Directory.Person

  def index(conn, _params) do
    people = Directory.list_people()
    render(conn, "index.html", people: people)
  end

  def new(conn, _params) do
    changeset = Directory.change_person(%Person{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"person" => person_params}) do
    case Directory.create_person(person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person created successfully.")
        |> redirect(to: Routes.person_path(conn, :show, person))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    person = Directory.get_person!(id)
    render(conn, "show.html", person: person)
  end

  def edit(conn, %{"id" => id}) do
    person = Directory.get_person!(id)
    changeset = Directory.change_person(person)
    render(conn, "edit.html", person: person, changeset: changeset)
  end

  def update(conn, %{"id" => id, "person" => person_params}) do
    person = Directory.get_person!(id)

    case Directory.update_person(person, person_params) do
      {:ok, person} ->
        conn
        |> put_flash(:info, "Person updated successfully.")
        |> redirect(to: Routes.person_path(conn, :show, person))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", person: person, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    person = Directory.get_person!(id)
    {:ok, _person} = Directory.delete_person(person)

    conn
    |> put_flash(:info, "Person deleted successfully.")
    |> redirect(to: Routes.person_path(conn, :index))
  end
end
