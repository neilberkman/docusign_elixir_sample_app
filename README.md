# Docusign Service Integration - Sample Elixir App

This app is a sample of using [docusign](https://hex.pm/docusign/) package.

## Introduction

This type of application interacts with DocuSign on its own. There is no user interface and no user is present during normal operation.

The application uses the OAuth JWT grant flow to impersonate a user in the account.

This launcher example includes two examples:

Send an HTML, DOCX, and PDF file in an envelope to be signed.
List the envelopes in the account that are less than 30 days old.

## Configure DocuSign

To use a Elixir DocuSign API, you should have a private/public keypair and Integrator Key generated. You can set it up on [Go to Admin](https://admindemo.docusign.com/api-integrator-key) page in your profile.

## Usage

1. Clone this repository;
2. Add your docusign private key to the project root as `docusign_key.pem` (or specify a path as a `DOCUSIGN_PRIVATE_KEY` env variable);
3. Set your Integration ID as `DOCUSIGN_CLIENT_ID` env variable;
4. Set your API Account ID as `DOCUSIGN_USER_ID` env variable;
5. Run:
```
mix deps.get
mix compile
mix docusign.example
```

Alternatively, you can run sample functions in the IEx session. To do so, just run `iex -S mix` and call those functions:
* `DocusignElixirSampleApp.get_envelopes()`
* `DocusignElixirSampleApp.send_envelop()`
