# frozen_string_literal: true

cask "tokens-runway" do
  version "1.5"
  sha256 "fa87180ef9bf2423b0edcfd1c783e4f544bad5390f4a2738e081c92ac188dc43"

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
