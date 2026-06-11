# frozen_string_literal: true

cask "tokens-runway" do
  version "1.4"
  sha256 "0a37fed350b14e097ea98c9f0cc20b8f41bca1b3efc38348ea99eba4e4116950"

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
