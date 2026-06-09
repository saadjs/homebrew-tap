# frozen_string_literal: true

cask "tokens-runway" do
  version "1.3"
  sha256 "34d67b89a2415f5fd3127f1d7b077dd270d4d6c9889cb1d794568ff3f0302a65"

  url "https://github.com/saadjs/Runway/releases/download/v#{version}/Runway-#{version}.zip"
  name "Runway"
  desc "Menu-bar app showing Claude Code and Codex usage limits"
  homepage "https://github.com/saadjs/Runway"

  depends_on macos: :ventura

  app "Runway.app"
end
