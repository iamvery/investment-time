defmodule InvestmentTime.InvestmentController do
  use InvestmentTime.Web, :controller

  alias InvestmentTime.Investment

  def yay(conn, params) do
    changeset = Investment.changeset %Investment{}, %{user_id: params["user_id"], used: true}

    user = Repo.insert!(changeset)
    conn
    |> redirect(to: "/")
  end

  def nay(conn, params) do
    changeset = Investment.changeset %Investment{}, %{user_id: params["user_id"], used: false}

    user = Repo.insert!(changeset)
    conn
    |> redirect(to: "/")
  end
end
