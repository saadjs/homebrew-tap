cask "view-md" do
  version "0.4.1"
  sha256 "4e47650c14ea36a35499bc3918a8676ecf53c50be4c65e231c1438b403050919"

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
