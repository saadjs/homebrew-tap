cask "view-md" do
  version "0.1.0"
  sha256 "f91442972e9c39403e991c7ccb287f3bce13aada2b2d1a5ffb7ffa13a0e0508c"

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
