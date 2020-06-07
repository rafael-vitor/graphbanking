# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graph_banking,
  ecto_repos: [GraphBanking.Repo]

# Configures the endpoint
config :graph_banking, GraphBankingWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GUYnZEu7JQxoadayFEys2BePsQRvgp5J3wv5sgk1DoQ6f5HNhwMSR4XVJaNWCjVp",
  render_errors: [view: GraphBankingWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: GraphBanking.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
