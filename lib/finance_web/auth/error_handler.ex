defmodule FinanceWeb.Auth.ErrorHandler do
  import Plug.Conn

  @behaviour Guardian.Plug.ErrorHandler

  @impl Guardian.Plug.ErrorHandler
  def auth_error(conn, {type, _reason}, _opts) do
  		msg = %{status: "error", error: to_string(type)}
    	body = Jason.encode!(msg)
   	  send_resp(conn, 403, body)
  end
end



