defmodule InvestmentTime.InvestmentTest do
  use InvestmentTime.ModelCase

  alias InvestmentTime.Investment

  @valid_attrs %{user_id: 1, used: true}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Investment.changeset(%Investment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Investment.changeset(%Investment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
