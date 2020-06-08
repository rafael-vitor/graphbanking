defmodule GraphBanking.Banking.TransactionsResolver do

  def create_transaction(_root, %{sender: sender, address: address, amount: amount}, _info) do
    try do
      if sender === address do
        raise "Address and sender can not be equal in a transaction"
      end

      sender_account = case GraphBanking.Banking.find_account(sender) do
        nil ->
          raise "Account not found for sender #{sender}"
        account -> account
      end

      address_account = case GraphBanking.Banking.find_account(address) do
        nil ->
          raise "Account not found for address #{address}"
        account -> account
      end

      case GraphBanking.Banking.update_account(
        sender_account,
        %{current_balance: sender_account.current_balance - amount}
      ) do
        {:error, _changeset} -> raise "Error updating sender account #{sender_account.id}"
        account -> account
      end

      #TODO: treat case where first update worked but second one does not 
      case GraphBanking.Banking.update_account(
        address_account,
        %{current_balance: address_account.current_balance + amount}
      ) do
        {:error, _changeset} -> raise "Error updating sender account #{address_account.id}"
        account -> account
      end

      case GraphBanking.Banking.create_transaction(
        %{sender: sender, amount: amount, address: address}
      ) do
        {:ok, transaction} -> {:ok, transaction}
        _error -> {:error, "Could not create transaction"}
      end

    rescue
      e in RuntimeError -> {:error, "#{e.message}"}
    end
  end

  def list_transactions(%{id: id}, _args, _info) do
    case GraphBanking.Banking.list_transactions_by_sender_id("#{id}") do
      nil ->
        {:error, "Account ID #{id} not found"}
        transactions -> {:ok, transactions}
    end
  end
end
