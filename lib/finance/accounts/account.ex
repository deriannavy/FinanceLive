defmodule Finance.Accounts.Account do
   use Ecto.Schema
   import Ecto.Changeset

   @primary_key {:id, :binary_id, autogenerate: true}
   @foreign_key_type :binary_id

   @derive {Jason.Encoder, only: [:id, :alias, :email]}

   schema "accounts" do
      field :alias, :string
      field :email, :string
      field :first_name, :string
      field :last_name, :string
      field :password, :string, virtual: true
      field :encrypted_password, :string

      timestamps()
  end

  @doc false
  def changeset(account, attrs) do
      account
      |> cast(attrs, [:email, :password, :alias])
      |> validate_required([:email, :password, :alias])
      |> validate_format(:password, ~r/^[\s\S]{8,}$/)
      |> validate_format(:alias, ~r/^[0-9a-z_]{6,25}$/)
      |> unique_constraint(:email)
      |> unique_constraint(:alias)
      |> put_hashed_password
  end

  defp put_hashed_password(changeset) do
      case changeset do
         %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
            put_change(
               changeset, :encrypted_password, 
               Comeonin.Bcrypt.hashpwsalt(password)
            )
         _ ->
            changeset
      end
   end

end
