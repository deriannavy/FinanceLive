# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :finance,
  ecto_repos: [Finance.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :finance, FinanceWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: FinanceWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Finance.PubSub,
  live_view: [signing_salt: "iX6xtIqf"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :finance, Finance.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason


config :finance, FinanceWeb.Auth.Guardian, # Password Hash Config
  issuer: "finance",
  same_site: "Strict",
  secure: true,
  secret_key: "I69X/P75Yj/qxcSIsW+tOyFg2lPblsQIFgQnpaYraOZeoPZLuhhl0tDw/OpanbUg"


config :cors_plug, # Cors configuration
  origin: ["http://localhost:8080", "http://192.168.1.6:8080"],
  max_age: 86400,
  methods: ["GET", "POST", "PATCH", "DELETE"]

config :plug, :statuses, %{ 444 => "Bad Credentials" }

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"