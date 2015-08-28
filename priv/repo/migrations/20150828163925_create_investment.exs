defmodule InvestmentTime.Repo.Migrations.CreateInvestment do
  use Ecto.Migration

  def change do
    create table(:investments) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :used, :boolean, null: false, default: false

      timestamps
    end

  end
end
