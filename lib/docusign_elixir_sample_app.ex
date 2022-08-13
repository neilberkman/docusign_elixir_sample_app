defmodule DocusignElixirSampleApp do
  @moduledoc """
  Documentation for DocusignElixirSampleApp.
  """
  require Logger
  alias DocuSign.Api

  @doc """
  Fetches all envelopes younger than 30 days.
  """
  @spec get_envelopes :: {:ok, list(DocuSign.Model.Envelopes.t())} | {:error, binary}
  def get_envelopes do
    from_date = Timex.shift(Date.utc_today(), days: -30)
    Logger.debug("Fetching envelopes...")

    # There's a mismatch in 1st param type here and in func spec
    case Api.Envelopes.envelopes_get_envelopes(connection(), account_id(), from_date: from_date) do
      {:ok, %DocuSign.Model.EnvelopesInformation{envelopes: envelopes}} ->
        Logger.debug("Fetched envelopes: #{inspect(envelopes)}")
        {:ok, envelopes}

      {:error, %Tesla.Env{body: error}} ->
        Logger.error(inspect(error))
        {:error, error}
    end
  end

  @doc """
  Sending a file to Docusign.
  """
  @spec send_envelop() :: {:ok, DocuSign.Model.EnvelopeDefinition.t()} | {:error, binary}
  def send_envelop do
    Logger.debug("Preparing envelopes...")

    documents =
      Enum.map(~w(docx html pdf), fn ext ->
        %DocuSign.Model.Document{
          documentBase64: Base.encode64(File.read!("priv/samples/sample.#{ext}")),
          name: "elixir.#{ext}",
          fileExtension: ext,
          documentId: Timex.to_unix(Timex.now())
        }
      end)

    definition = %DocuSign.Model.EnvelopeDefinition{
      emailSubject: "Please sign this documents sent from Elixir SDK",
      documents: documents
    }

    Logger.debug("Sending envelopes...")

    case Api.Envelopes.envelopes_post_envelopes(connection(), account_id(),
           envelopeDefinition: definition
         ) do
      {:ok, %DocuSign.Model.EnvelopeSummary{} = envelope_summary} ->
        Logger.debug("Envelopes has been sent.")
        envelope_summary

      {:error, %Tesla.Env{body: error}} ->
        Logger.error(inspect(error))
        {:error, error}
    end
  end

  defp connection do
    DocuSign.Connection.new
    |> DocuSign.Connection.Request.new
  end
  defp account_id, do: Application.get_env(:docusign, :account_id)
end
