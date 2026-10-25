# frozen_string_literal: true

cask "tokens-runway" do
  version "1.10"
  sha256 "670bf78b0ce29410f4b5f4ed7f8f05d900b2cf222d9b82fd546c48280d4373c8"

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
