defmodule Mix.Tasks.Docusign.Example do
  @shortdoc "Getting envelopes from Docusign and sending PDF, HTML and DOCX example files"
  use Mix.Task

  def run(_args) do
    Application.ensure_all_started(:docusign)
    DocusignElixirSampleApp.get_envelopes()
    DocusignElixirSampleApp.send_envelop()
    :noop
  end
end
