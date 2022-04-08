defmodule FirstMixArchive.MixProject do
  use Mix.Project

  def project do
    [
      app: :first_mix_archive,
      version: version(),
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases
    ]
  end

  def version, do: "1.0.0"

  defp aliases do
    [
      build: [&build_releases/1]
    ]
  end

  defp build_releases(_) do
    Mix.Tasks.Compile.run([])
    Mix.Tasks.Archive.Build.run([])
    Mix.Tasks.Archive.Build.run(["--output=foo.ez"])
    File.rename("foo.ez", "./foo_archives/foo.ez")
    File.rename("foo-#{version()}.ez", "./foo_archives/foo-#{version()}.ez")
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
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
