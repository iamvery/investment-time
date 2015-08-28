defmodule InvestmentTime.User do
  use InvestmentTime.Web, :model

  alias InvestmentTime.Investment

  schema "users" do
    field :email, :string
    has_many :investments, Investment

    timestamps
  end

  @required_fields ~w(email)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
