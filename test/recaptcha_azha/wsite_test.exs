defmodule RecaptchaAzha.WsiteTest do
  use RecaptchaAzha.DataCase

  alias RecaptchaAzha.Wsite

  describe "windows" do
    alias RecaptchaAzha.Wsite.Window

    @valid_attrs %{body: "some body", email: "some email", name: "some name", subject: "some subject"}
    @update_attrs %{body: "some updated body", email: "some updated email", name: "some updated name", subject: "some updated subject"}
    @invalid_attrs %{body: nil, email: nil, name: nil, subject: nil}

    def window_fixture(attrs \\ %{}) do
      {:ok, window} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Wsite.create_window()

      window
    end

    test "list_windows/0 returns all windows" do
      window = window_fixture()
      assert Wsite.list_windows() == [window]
    end

    test "get_window!/1 returns the window with given id" do
      window = window_fixture()
      assert Wsite.get_window!(window.id) == window
    end

    test "create_window/1 with valid data creates a window" do
      assert {:ok, %Window{} = window} = Wsite.create_window(@valid_attrs)
      assert window.body == "some body"
      assert window.email == "some email"
      assert window.name == "some name"
      assert window.subject == "some subject"
    end

    test "create_window/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Wsite.create_window(@invalid_attrs)
    end

    test "update_window/2 with valid data updates the window" do
      window = window_fixture()
      assert {:ok, %Window{} = window} = Wsite.update_window(window, @update_attrs)
      assert window.body == "some updated body"
      assert window.email == "some updated email"
      assert window.name == "some updated name"
      assert window.subject == "some updated subject"
    end

    test "update_window/2 with invalid data returns error changeset" do
      window = window_fixture()
      assert {:error, %Ecto.Changeset{}} = Wsite.update_window(window, @invalid_attrs)
      assert window == Wsite.get_window!(window.id)
    end

    test "delete_window/1 deletes the window" do
      window = window_fixture()
      assert {:ok, %Window{}} = Wsite.delete_window(window)
      assert_raise Ecto.NoResultsError, fn -> Wsite.get_window!(window.id) end
    end

    test "change_window/1 returns a window changeset" do
      window = window_fixture()
      assert %Ecto.Changeset{} = Wsite.change_window(window)
    end
  end
end
