defmodule Henchman.Mixfile do
  use Mix.Project

  def project do
    [app: :henchman,
     version: "0.2.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     description: "Set of helpers for Elixir",
     package: package]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ex_doc, "~> 0.11", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Ahmad Shah Hafizan Hamidin"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/elepunk/henchman"},
      files: ["lib", "mix.exs", "README.md", "LICENSE"]
    ]
  end
end
