defmodule InvestmentTime.UserController do
  use InvestmentTime.Web, :controller

  alias InvestmentTime.Repo
  alias InvestmentTime.User

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end
end
