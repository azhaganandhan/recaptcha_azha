defmodule RecaptchaAzha.WebTest do
  use RecaptchaAzha.DataCase

  alias RecaptchaAzha.Web

  describe "todos" do
    alias RecaptchaAzha.Web.Todo

    @valid_attrs %{body: "some body", email: "some email", name: "some name", subject: "some subject"}
    @update_attrs %{body: "some updated body", email: "some updated email", name: "some updated name", subject: "some updated subject"}
    @invalid_attrs %{body: nil, email: nil, name: nil, subject: nil}

    def todo_fixture(attrs \\ %{}) do
      {:ok, todo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Web.create_todo()

      todo
    end

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert Web.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Web.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      assert {:ok, %Todo{} = todo} = Web.create_todo(@valid_attrs)
      assert todo.body == "some body"
      assert todo.email == "some email"
      assert todo.name == "some name"
      assert todo.subject == "some subject"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Web.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{} = todo} = Web.update_todo(todo, @update_attrs)
      assert todo.body == "some updated body"
      assert todo.email == "some updated email"
      assert todo.name == "some updated name"
      assert todo.subject == "some updated subject"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Web.update_todo(todo, @invalid_attrs)
      assert todo == Web.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Web.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Web.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Web.change_todo(todo)
    end
  end
end
