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

  defp connection, do: DocuSign.Connection.new(client: DocuSign.APIClient.client())
  defp account_id, do: Application.get_env(:docusign, :user_id)
end
