defmodule GraphBanking.BankingTest do
  use GraphBanking.DataCase

  alias GraphBanking.Banking

  describe "accounts" do
    alias GraphBanking.Banking.Account

    @valid_attrs %{current_balance: 120.5}
    @update_attrs %{current_balance: 456.7}
    @invalid_attrs %{current_balance: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Banking.create_account()

      account
    end

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Banking.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Banking.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Banking.create_account(@valid_attrs)
      assert account.current_balance == 120.5
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banking.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, account} = Banking.update_account(account, @update_attrs)
      assert %Account{} = account
      assert account.current_balance == 456.7
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Banking.update_account(account, @invalid_attrs)
      assert account == Banking.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Banking.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Banking.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Banking.change_account(account)
    end
  end

  describe "transactions" do
    alias GraphBanking.Banking.Transaction

    @valid_attrs %{address: "7488a646-e31f-11e4-aace-600308960662", amount: 120.5, sender: "7488a646-e31f-11e4-aace-600308960662", when: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{address: "7488a646-e31f-11e4-aace-600308960668", amount: 456.7, sender: "7488a646-e31f-11e4-aace-600308960668", when: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{address: nil, amount: nil, sender: nil, when: nil}

    def transaction_fixture(attrs \\ %{}) do
      {:ok, transaction} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Banking.create_transaction()

      transaction
    end

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Banking.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Banking.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      assert {:ok, %Transaction{} = transaction} = Banking.create_transaction(@valid_attrs)
      assert transaction.address == "7488a646-e31f-11e4-aace-600308960662"
      assert transaction.amount == 120.5
      assert transaction.sender == "7488a646-e31f-11e4-aace-600308960662"
      assert transaction.when == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Banking.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      assert {:ok, transaction} = Banking.update_transaction(transaction, @update_attrs)
      assert %Transaction{} = transaction
      assert transaction.address == "7488a646-e31f-11e4-aace-600308960668"
      assert transaction.amount == 456.7
      assert transaction.sender == "7488a646-e31f-11e4-aace-600308960668"
      assert transaction.when == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Banking.update_transaction(transaction, @invalid_attrs)
      assert transaction == Banking.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Banking.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Banking.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Banking.change_transaction(transaction)
    end
  end
end
