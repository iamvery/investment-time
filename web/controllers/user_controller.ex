defmodule InvestmentTime.UserController do
  use InvestmentTime.Web, :controller

  alias InvestmentTime.Repo
  alias InvestmentTime.User

  def index(conn, _params) do
    user = User.changeset(%User{})
    users = Repo.all(User) |> Repo.preload(:investments)
    render conn, "index.html", user: user, users: users
  end

  def create(conn, params) do
    changeset = User.changeset %User{}, params["user"]

    if changeset.valid? do
      user = Repo.insert!(changeset)
      conn
      |> put_flash(:info, "And so it was...")
      |> redirect(to: "/")
    else
      conn
      |> put_flash(:error, "Something is wrong with your email!")
      |> redirect(to: "/")
    end
  end
end
