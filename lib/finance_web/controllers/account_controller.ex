defmodule FinanceWeb.AccountController do
   use FinanceWeb, :controller

   alias Finance.Accounts
   alias FinanceWeb.Auth.Guardian

   action_fallback FinanceWeb.FallbackController


   @doc """
      >>> Register an acccount
   """
   def register(conn, %{"account" => account_params}) do
      with {:ok, account} <- Accounts.create_account(account_params),
           {:ok, _token, _claims} <- Guardian.encode_and_sign(account) do
         conn
         |> Guardian.Plug.remember_me(account, %{}, key: :finance)
         |> put_status(:created)
         |> render("response.json", %{status: :success, message: :created})
      end
   end

   @doc """
      >>> Login an acccount
   """
   def login(conn, %{"account" => account, "password" => password}) do
      with {:ok, account, _token} <- Guardian.authenticate(account, password) do
         conn
         |> Guardian.Plug.remember_me(account, %{}, key: :finance)
         |> put_status(:created)
         |> render("response.json", %{status: :success, message: :created})
      end
   end

   @doc """
      >>> Logout an acccount
   """
   def logout(conn, _) do 
      conn 
      |> Guardian.Plug.sign_out 
      |> put_status(:ok) 
      |> render("response.json", %{status: :success, msg: :logout})
   end

end
