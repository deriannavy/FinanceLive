defmodule FinanceWeb.Auth.Guardian do
   use Guardian, otp_app: :finance

   alias Finance.Accounts


   def subject_for_token(account, _claims) do
      sub = to_string(account.alias)
      {:ok, sub}
   end

   def resource_from_claims(claims) do
    
      with account <- Accounts.get_by_account(claims["sub"]) do
         {:ok,  account}
      else
         nil ->
            {:error, :not_found}
      end
    
   end

   def authenticate(alias_account, password) do
      with {:ok, account} <- Accounts.get_by_account(alias_account) do
         case validate_password(password, account.encrypted_password) do
            true ->
               account |> create_token
            false ->
               {:error, :bad_credentials}
         end
      end
   end

   defp validate_password(password, encrypted_password) do
      Comeonin.Bcrypt.checkpw(password, encrypted_password)
   end

   defp create_token(account) do
      {:ok, token, _claims} = encode_and_sign(account)
      {:ok, account, token}
   end
  
end