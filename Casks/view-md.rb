cask "view-md" do
  version "0.0.0"
  sha256 :no_check

  url "https://github.com/saadjs/view-md/releases/download/v#{version}/ViewMD-#{version}.dmg"
  name "ViewMD"
  desc "Native macOS Markdown viewer with Quick Look support"
  homepage "https://github.com/saadjs/view-md"

  app "ViewMD.app"

  zap trash: [
    "~/Library/Preferences/sh.saad.view-md.plist",
    "~/Library/Saved Application State/sh.saad.view-md.savedState",
  ]
end
