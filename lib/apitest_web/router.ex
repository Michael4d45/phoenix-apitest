defmodule ApitestWeb.Router do
  use ApitestWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug CORSPlug, origin: "*"
    plug :accepts, ["json"]
  end

  scope "/", ApitestWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/apitest", ApiController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ApitestWeb do
    pipe_through :api
    resources "/users", UserController
    options "/users", UserController, :options
  end
end
