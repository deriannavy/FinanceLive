defmodule FinanceWeb.AccountView do
   use FinanceWeb, :view
  
   def render("response.json", %{status: status, message: message}) do
      %{status: status, message: message}
   end
end
