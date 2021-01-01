defmodule OpenULM.DirectoryTest do
  use OpenULM.DataCase

  alias OpenULM.Directory

  describe "people" do
    alias OpenULM.Directory.Person

    @valid_attrs %{email: "some email", full_name: "some full_name", preferred_name: "some preferred_name"}
    @update_attrs %{email: "some updated email", full_name: "some updated full_name", preferred_name: "some updated preferred_name"}
    @invalid_attrs %{email: nil, full_name: nil, preferred_name: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_person()

      person
    end

    test "list_people/0 returns all people" do
      person = person_fixture()
      assert Directory.list_people() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Directory.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Directory.create_person(@valid_attrs)
      assert person.email == "some email"
      assert person.full_name == "some full_name"
      assert person.preferred_name == "some preferred_name"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Directory.update_person(person, @update_attrs)
      assert person.email == "some updated email"
      assert person.full_name == "some updated full_name"
      assert person.preferred_name == "some updated preferred_name"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_person(person, @invalid_attrs)
      assert person == Directory.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Directory.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Directory.change_person(person)
    end
  end

  describe "groups" do
    alias OpenULM.Directory.Group

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def group_fixture(attrs \\ %{}) do
      {:ok, group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Directory.create_group()

      group
    end

    test "list_groups/0 returns all groups" do
      group = group_fixture()
      assert Directory.list_groups() == [group]
    end

    test "get_group!/1 returns the group with given id" do
      group = group_fixture()
      assert Directory.get_group!(group.id) == group
    end

    test "create_group/1 with valid data creates a group" do
      assert {:ok, %Group{} = group} = Directory.create_group(@valid_attrs)
      assert group.name == "some name"
    end

    test "create_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_group(@invalid_attrs)
    end

    test "update_group/2 with valid data updates the group" do
      group = group_fixture()
      assert {:ok, %Group{} = group} = Directory.update_group(group, @update_attrs)
      assert group.name == "some updated name"
    end

    test "update_group/2 with invalid data returns error changeset" do
      group = group_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_group(group, @invalid_attrs)
      assert group == Directory.get_group!(group.id)
    end

    test "delete_group/1 deletes the group" do
      group = group_fixture()
      assert {:ok, %Group{}} = Directory.delete_group(group)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_group!(group.id) end
    end

    test "change_group/1 returns a group changeset" do
      group = group_fixture()
      assert %Ecto.Changeset{} = Directory.change_group(group)
    end
  end
end
