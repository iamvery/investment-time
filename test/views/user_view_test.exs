defmodule InvestmentTime.UserViewTest do
  use InvestmentTime.ConnCase, async: true

  alias InvestmentTime.UserView

  test "#name for valid email" do
    name = UserView.name(%{email: "jay@iamvery.com"})
    assert name == "jay"
  end
end
