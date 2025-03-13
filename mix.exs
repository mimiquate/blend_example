if File.exists?("blend/premix.exs") do
  Code.compile_file("blend/premix.exs")
end

defmodule MyLibrary.MixProject do
  use Mix.Project

  def project do
    [
      app: :my_library,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
    |> Keyword.merge(maybe_lockfile_option())
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_crypto, "~> 1.2 or ~> 2.0"},
      {:blend, "~> 0.5.0", only: :dev}
    ]
  end

  defp maybe_lockfile_option do
    case System.get_env("MIX_LOCKFILE") do
      nil -> []
      "" -> []
      lockfile -> [lockfile: lockfile]
     end
  end
end
