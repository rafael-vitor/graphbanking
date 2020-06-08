defmodule GraphBanking.Banking.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transactions" do
    field :address, :integer
    field :amount, :float
    field :sender, :integer
    field :when, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> Map.put(:when, DateTime.utc_now)
    |> cast(attrs, [:address, :amount, :sender])
    |> validate_required([:address, :amount, :sender])
  end
end
