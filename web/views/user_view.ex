defmodule InvestmentTime.UserView do
  use InvestmentTime.Web, :view

  def name(user) do
    [name|_] = String.split(user.email, "@")
    name
  end

  def most_recent_investment(user) do
    user.investments
    |> Enum.filter(&(&1.used))
    |> Enum.sort(&(&1.inserted_at > &2.inserted_at))
    |> List.first
  end
end
