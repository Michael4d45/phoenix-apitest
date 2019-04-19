defmodule ApitestWeb.PageController do
  use ApitestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
