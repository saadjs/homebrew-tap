# frozen_string_literal: true

cask "tokens-runway" do
  version "1.9"
  sha256 "5f492ae18afac2f36388db38acbe642ed622daa2a96bd3e0b77b7c15589abab8"

  url "https://github.com/saadjs/Runway/releases/download/v#{version}/Runway-#{version}.zip"
  name "Runway"
  desc "Menu-bar app showing Claude Code and Codex usage limits"
  homepage "https://github.com/saadjs/Runway"

  depends_on macos: :ventura

  app "Runway.app"

  zap trash: [
    "~/Library/Caches/app.runway",
    "~/Library/HTTPStorages/app.runway",
    "~/Library/HTTPStorages/app.runway.binarycookies",
    "~/Library/Preferences/app.runway.plist",
    "~/Library/Saved Application State/app.runway.savedState",
  ]
end
