cask "view-md" do
  version "0.4.0"
  sha256 "7d16ea856314285a9794e97b6b9bd62bb2703f45ca9bb14718b2c89a1f23b328"

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
