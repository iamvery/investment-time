# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :investment_time, InvestmentTime.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  secret_key_base: "EYrx67Rk2tWJUU9jV3ZlVe7KDn3x4dIRUXl74NYNiaDXQfLQtA5Nk6KJxpl6qDcf",
  render_errors: [accepts: ~w(html json)],
  pubsub: [name: InvestmentTime.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :mailer,
  mailgun_domain: System.get_env("MAILGUN_DOMAIN"),
  mailgun_key: System.get_env("MAILGUN_API_KEY")

config :quantum, cron: [
  "* * * * *": fn -> IO.puts("Heartbeat") end,
  "@weekly": &InvestmentTime.Mailer.ask_everyone/0,
]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
