defmodule GraphBanking.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :address, :integer
      add :amount, :float
      add :sender, :integer
      add :when, :naive_datetime

      timestamps()
    end

  end
end
