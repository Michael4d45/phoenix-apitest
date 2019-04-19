defmodule ApitestWeb.ApiController do
  use ApitestWeb, :controller
  
  alias Apitest.ApitestWeb
  
  def index(conn, _params) do
    users = ApitestWeb.list_users()
    render(conn, "index.html", users: users)
  end

end
