defmodule GraphBankingWeb.Types do
  use Absinthe.Schema.Notation

  alias GraphBanking.Banking

  object :account do
    field(:id, non_null(:id))
    field(:current_balance, non_null(:float))
    field(:transactions, list_of(:transaction)) do
      resolve &Banking.TransactionsResolver.list_transactions/3
    end
  end

  object :transaction do
    field(:id, :id)
    field(:address, :id)
    field(:amount, :float)
    field(:when, :naive_datetime)
  end
end