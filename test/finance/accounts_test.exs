defmodule Finance.AccountsTest do
  use Finance.DataCase

  alias Finance.Accounts

  describe "accounts" do
    alias Finance.Accounts.Account

    import Finance.AccountsFixtures

    @invalid_attrs %{alias: nil, email: nil, encrypted_password: nil, name: nil, type: nil}

    test "list_accounts/0 returns all accounts" do
      account = account_fixture()
      assert Accounts.list_accounts() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Accounts.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      valid_attrs = %{alias: "some alias", email: "some email", encrypted_password: "some encrypted_password", name: "some name", type: "some type"}

      assert {:ok, %Account{} = account} = Accounts.create_account(valid_attrs)
      assert account.alias == "some alias"
      assert account.email == "some email"
      assert account.encrypted_password == "some encrypted_password"
      assert account.name == "some name"
      assert account.type == "some type"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      update_attrs = %{alias: "some updated alias", email: "some updated email", encrypted_password: "some updated encrypted_password", name: "some updated name", type: "some updated type"}

      assert {:ok, %Account{} = account} = Accounts.update_account(account, update_attrs)
      assert account.alias == "some updated alias"
      assert account.email == "some updated email"
      assert account.encrypted_password == "some updated encrypted_password"
      assert account.name == "some updated name"
      assert account.type == "some updated type"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_account(account, @invalid_attrs)
      assert account == Accounts.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Accounts.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Accounts.change_account(account)
    end
  end
end
