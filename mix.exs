defmodule DocusignElixirSampleApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :docusign_elixir_sample_app,
      version: "0.2.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      applications: [:docusign],
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:docusign, git: "https://github.com/un3481/docusign_elixir.git", tag: "0.5.2"},
      {:timex, "~> 3.4"},
      {:hackney, "~> 1.6"}
    ]
  end

  # Run mix escript.build to build an executable.
  defp escript() do
    [main_module: DocusignElixirSampleApp.CLI]
  end
end
