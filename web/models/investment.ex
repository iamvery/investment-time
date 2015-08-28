defmodule InvestmentTime.Investment do
  use InvestmentTime.Web, :model

  schema "investments" do
    belongs_to :user, User
    field :used, :boolean

    timestamps
  end

  @required_fields ~w(user_id used)
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

defimpl Phoenix.HTML.Safe, for: InvestmentTime.Investment do
  def to_iodata(investment) do
    to_string(investment.inserted_at)
  end
end
