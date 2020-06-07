defmodule GraphBanking.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :address, :uuid
      add :amount, :float
      add :sender, :uuid
      add :when, :naive_datetime

      timestamps()
    end

  end
end
