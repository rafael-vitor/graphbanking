defmodule GraphBanking.Banking.AccountsResolver do
  alias GraphBanking.Banking

  def find(_root, %{id: id}, _info) do
    case Banking.find_account(id) do
      nil -> {:error, "Account not found for id #{id}"}
      account -> {:ok, account}
    end
  end

  def create_account(_root, %{balance: balance}, _info) do
    case Banking.create_account(%{:current_balance => balance}) do
      {:ok, account} -> {:ok, account}
      {:error, changeset} ->
        {message, _value} = changeset.errors[:current_balance]
        {:error, message}
     end
  end

end