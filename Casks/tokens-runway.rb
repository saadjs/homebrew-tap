# frozen_string_literal: true

cask "tokens-runway" do
  version "1.2"
  sha256 "aac956dfe45704f3cc2485d3fec9ccae1c6842acf68eba0e1d45e694bed606ac"

  url "https://github.com/saadjs/Runway/releases/download/v#{version}/Runway-#{version}.zip"
  name "Runway"
  desc "Menu-bar app showing Claude Code and Codex usage limits"
  homepage "https://github.com/saadjs/Runway"

  depends_on macos: :ventura

  app "Runway.app"
end
