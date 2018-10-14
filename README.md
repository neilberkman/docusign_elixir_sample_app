# Docusign Service Integration - Sample Elixir App

This app is an example of using the [docusign](https://hex.pm/packages/docusign) package.

## Introduction

This type of application interacts with DocuSign on its own. There is no user interface and no user is present during normal operation.

The application uses the OAuth JWT grant flow to impersonate a user in the account.

This launcher example includes two examples:

Send an HTML, DOCX, and PDF file in an envelope to be signed.
List the envelopes in the account that are less than 30 days old.

## Configure DocuSign

To use the Elixir DocuSign API, you should have a private/public keypair and Integrator Key generated. You can set it up from the [Go to Admin](https://admindemo.docusign.com/api-integrator-key) page in your profile.

## Usage

1. Clone this repository;
2. Add your docusign private key to the project root as `docusign_key.pem` (or specify a path as a `DOCUSIGN_PRIVATE_KEY` env variable);
3. Set your Integration ID as `DOCUSIGN_CLIENT_ID` env variable;
4. Set your API Username as `DOCUSIGN_USER_ID` env variable;
5. Set your API Account ID as `DOCUSIGN_ACCOUNT_ID` env variable;
6. Run:

```sh
mix deps.get
mix compile
mix docusign.example
```

You may also choose to set all of the configuration directly in the `config.exs` file.

Alternatively, you can run sample functions in the IEx session. To do so, just run `iex -S mix` and call those functions:

* `DocusignElixirSampleApp.get_envelopes()`
* `DocusignElixirSampleApp.send_envelop()`
