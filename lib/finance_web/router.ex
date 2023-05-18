defmodule FinanceWeb.Router do
   use FinanceWeb, :router

   pipeline :api, do: plug :accepts, ["json"]
   pipeline :auth, do: plug FinanceWeb.Auth.Pipeline
   pipeline :auth_required, do: plug FinanceWeb.AuthRequired.Pipeline

   scope "/api/v1", FinanceWeb do
      pipe_through :api


      post "/register", AccountController, :register
      post "/login", AccountController, :login

   end

   # Enables the Swoosh mailbox preview in development.
   #
   # Note that preview only shows emails that were sent by the same
   # node running the Phoenix server.
   # if Mix.env() == :dev do
   #    scope "/dev" do
   #       pipe_through [:fetch_session, :protect_from_forgery]

   #       forward "/mailbox", Plug.Swoosh.MailboxPreview
   #    end
   # end
end
