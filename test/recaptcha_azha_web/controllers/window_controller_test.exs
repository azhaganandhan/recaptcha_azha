defmodule RecaptchaAzhaWeb.WindowControllerTest do
  use RecaptchaAzhaWeb.ConnCase

  alias RecaptchaAzha.Wsite

  @create_attrs %{body: "some body", email: "some email", name: "some name", subject: "some subject"}
  @update_attrs %{body: "some updated body", email: "some updated email", name: "some updated name", subject: "some updated subject"}
  @invalid_attrs %{body: nil, email: nil, name: nil, subject: nil}

  def fixture(:window) do
    {:ok, window} = Wsite.create_window(@create_attrs)
    window
  end

  describe "index" do
    test "lists all windows", %{conn: conn} do
      conn = get(conn, Routes.window_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Windows"
    end
  end

  describe "new window" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.window_path(conn, :new))
      assert html_response(conn, 200) =~ "New Window"
    end
  end

  describe "create window" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.window_path(conn, :create), window: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.window_path(conn, :show, id)

      conn = get(conn, Routes.window_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Window"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.window_path(conn, :create), window: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Window"
    end
  end

  describe "edit window" do
    setup [:create_window]

    test "renders form for editing chosen window", %{conn: conn, window: window} do
      conn = get(conn, Routes.window_path(conn, :edit, window))
      assert html_response(conn, 200) =~ "Edit Window"
    end
  end

  describe "update window" do
    setup [:create_window]

    test "redirects when data is valid", %{conn: conn, window: window} do
      conn = put(conn, Routes.window_path(conn, :update, window), window: @update_attrs)
      assert redirected_to(conn) == Routes.window_path(conn, :show, window)

      conn = get(conn, Routes.window_path(conn, :show, window))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, window: window} do
      conn = put(conn, Routes.window_path(conn, :update, window), window: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Window"
    end
  end

  describe "delete window" do
    setup [:create_window]

    test "deletes chosen window", %{conn: conn, window: window} do
      conn = delete(conn, Routes.window_path(conn, :delete, window))
      assert redirected_to(conn) == Routes.window_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.window_path(conn, :show, window))
      end
    end
  end

  defp create_window(_) do
    window = fixture(:window)
    {:ok, window: window}
  end
end
