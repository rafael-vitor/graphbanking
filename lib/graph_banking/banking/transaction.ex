defmodule GraphBanking.Banking.Transaction do
  use Ecto.Schema
  import Ecto.Changeset


  schema "transactions" do
    field :address, Ecto.UUID
    field :amount, :float
    field :sender, Ecto.UUID
    field :when, :naive_datetime

    timestamps()
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:address, :amount, :sender, :when])
    |> validate_required([:address, :amount, :sender, :when])
  end
end
