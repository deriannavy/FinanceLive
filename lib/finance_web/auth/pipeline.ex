defmodule FinanceWeb.AuthRequired.Pipeline do

  use Guardian.Plug.Pipeline, otp_app: :finance, 
                              module: FinanceWeb.Auth.Guardian, 
                              error_handler: FinanceWeb.Auth.ErrorHandler

	plug Guardian.Plug.VerifyCookie, key: :finance
	plug Guardian.Plug.EnsureAuthenticated, key: :finance
	plug Guardian.Plug.LoadResource, key: :finance
end


defmodule FinanceWeb.Auth.Pipeline do

  use Guardian.Plug.Pipeline, otp_app: :finance, 
                              module: FinanceWeb.Auth.Guardian, 
                              error_handler: FinanceWeb.Auth.ErrorHandler

   plug Guardian.Plug.VerifyCookie, key: :finance
   plug Guardian.Plug.LoadResource, key: :finance, allow_blank: true
end
