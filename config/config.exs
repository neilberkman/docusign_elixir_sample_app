# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :docusign, private_key: System.get_env("DOCUSIGN_PRIVATE_KEY") || "docusign_key.pem"
config :docusign, token_expires_in: 3600
config :docusign, hostname: "account-d.docusign.com"
config :docusign, client_id: System.get_env("DOCUSIGN_CLIENT_ID")
config :docusign, user_id: System.get_env("DOCUSIGN_USER_ID")
config :docusign, account_id: System.get_env("DOCUSIGN_ACCOUNT_ID")

config :tesla, :adapter, Tesla.Adapter.Hackney
