# frozen_string_literal: true

cask "tokens-runway" do
  version "1.7"
  sha256 "7b6cd0314eac3cca6dcc35b0aea0e8d9049b4b988b3b17fd588c18831b17181d"

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
