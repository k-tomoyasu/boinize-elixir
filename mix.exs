defmodule Boinize.MixProject do
  use Mix.Project

  def project do
    [
      app: :boinize,
      version: "0.1.0",
      elixir: "~> 1.8",
      description: "Japanese vowel(`boin`) converter using `Cabocha`",
      package: [
        maintainers: ["k-tomoyasu"],
        licenses: ["MIT"],
        links: %{"GitHub" => "https://github.com/k-tomoyasu/boinize-elixir"}
      ],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
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
      {:cabo_cha, "~> 1.0.0"},
      {:ex_doc, "~> 0.10", only: :dev}
    ]
  end
end
