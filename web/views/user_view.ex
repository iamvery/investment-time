defmodule InvestmentTime.UserView do
  use InvestmentTime.Web, :view

  def name(user) do
    [name|_] = String.split(user.email, "@")
    name
  end
end
