defmodule RecaptchaAzhaWeb.Router do
  use RecaptchaAzhaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RecaptchaAzhaWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/todos", TodoController
    resources "/windows", WindowController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RecaptchaAzhaWeb do
  #   pipe_through :api
  # end
end
