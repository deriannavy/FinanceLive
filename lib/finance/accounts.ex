defmodule Finance.Accounts do
   @moduledoc """
   The Accounts context.
   """

   import Ecto.Query, warn: false
   alias Finance.Repo

   alias Finance.Accounts.Account


   @doc """
      Get account by email or alias
         >>> { email | alias }
   """
   def get_by_account(field) do
      
      q = if String.match?(field, ~r/^[0-9a-z_]{4,25}$/), do: [alias: field], else: [email: field]

      case Repo.get_by(Account, q) do
         nil ->
            {:error, :not_found}
         account ->
            {:ok, account}
      end
   end

   @doc """
   Creates a account.

   ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

   """
   def create_account(attrs \\ %{}) do
      %Account{}
      |> Account.changeset(attrs)
      |> Repo.insert()
   end

   @doc """
   Updates a account.

   ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

   """
   def update_account(%Account{} = account, attrs) do
      account
      |> Account.changeset(attrs)
      |> Repo.update()
   end

end
