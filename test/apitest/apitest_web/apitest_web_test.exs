defmodule Apitest.ApitestWebTest do
  use Apitest.DataCase

  alias Apitest.ApitestWeb

  describe "users" do
    alias Apitest.ApitestWeb.User

    @valid_attrs %{name: "some name", password: "some password"}
    @update_attrs %{name: "some updated name", password: "some updated password"}
    @invalid_attrs %{name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> ApitestWeb.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert ApitestWeb.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert ApitestWeb.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = ApitestWeb.create_user(@valid_attrs)
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ApitestWeb.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = ApitestWeb.update_user(user, @update_attrs)
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = ApitestWeb.update_user(user, @invalid_attrs)
      assert user == ApitestWeb.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = ApitestWeb.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> ApitestWeb.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = ApitestWeb.change_user(user)
    end
  end
end
