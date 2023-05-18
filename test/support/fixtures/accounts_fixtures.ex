defmodule Finance.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Finance.Accounts` context.
  """

  @doc """
  Generate a account.
  """
  def account_fixture(attrs \\ %{}) do
    {:ok, account} =
      attrs
      |> Enum.into(%{
        alias: "some alias",
        email: "some email",
        encrypted_password: "some encrypted_password",
        name: "some name",
        type: "some type"
      })
      |> Finance.Accounts.create_account()

    account
  end
end
