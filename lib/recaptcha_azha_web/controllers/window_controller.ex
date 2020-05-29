defmodule RecaptchaAzhaWeb.WindowController do
  use RecaptchaAzhaWeb, :controller

  alias RecaptchaAzha.Wsite
  alias RecaptchaAzha.Wsite.Window

  def index(conn, _params) do
    windows = Wsite.list_windows()
    render(conn, "index.html", windows: windows)
  end

  def new(conn, _params) do
    changeset = Wsite.change_window(%Window{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"window" => window_params}) do
    case Wsite.create_window(window_params) do
      {:ok, window} ->
        conn
        |> put_flash(:info, "Window created successfully.")
        |> redirect(to: Routes.window_path(conn, :show, window))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    window = Wsite.get_window!(id)
    render(conn, "show.html", window: window)
  end

  def edit(conn, %{"id" => id}) do
    window = Wsite.get_window!(id)
    changeset = Wsite.change_window(window)
    render(conn, "edit.html", window: window, changeset: changeset)
  end

  def update(conn, %{"id" => id, "window" => window_params}) do
    window = Wsite.get_window!(id)

    case Wsite.update_window(window, window_params) do
      {:ok, window} ->
        conn
        |> put_flash(:info, "Window updated successfully.")
        |> redirect(to: Routes.window_path(conn, :show, window))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", window: window, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    window = Wsite.get_window!(id)
    {:ok, _window} = Wsite.delete_window(window)

    conn
    |> put_flash(:info, "Window deleted successfully.")
    |> redirect(to: Routes.window_path(conn, :index))
  end
end
