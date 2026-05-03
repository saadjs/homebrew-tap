cask "view-md" do
  version "0.1.1"
  sha256 "442d49a5dc2ec4057271fd3f548d6fbfda3d2709268ac877e737efb7bfa85e22"

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
