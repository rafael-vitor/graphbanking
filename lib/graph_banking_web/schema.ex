defmodule GraphBankingWeb.Schema do
  use Absinthe.Schema
  alias GraphBanking.Banking

  import_types Absinthe.Type.Custom

  import_types GraphBankingWeb.Types

  query do
    field :account, :account do
      arg :id, non_null(:id)
      resolve &Banking.AccountsResolver.find/3
    end
  end

  mutation do
    field :open_account, type: :account do
      arg :balance, non_null(:float)
      resolve &Banking.AccountsResolver.create_account/3
    end

    field :transfer_money, type: :transaction do
      arg :sender, non_null(:id)
      arg :address, non_null(:id)
      arg :amount, non_null(:float)
      resolve &Banking.TransactionsResolver.create_transaction/3
    end
  end

end