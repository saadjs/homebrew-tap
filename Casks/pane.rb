# frozen_string_literal: true

cask "pane" do
  version "0.2.0"
  sha256 "348de84ffbb497e8875ab1d4c711aa5583ff182b5c5badfd8cb9416194c47366"

  url "https://github.com/saadjs/pane-wm/releases/download/v#{version}/Pane-#{version}.zip"
  name "Pane"
  desc "Menu bar app for switching apps and arranging windows with shortcuts"
  homepage "https://github.com/saadjs/pane-wm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Pane.app"

  uninstall quit: "sh.saad.pane"

  zap trash: [
    "~/.config/pane",
    "~/Library/Preferences/sh.saad.pane.plist",
  ]

  caveats <<~EOS
    Open Pane, choose Open Settings…, and turn on Pane under
    Privacy & Security → Accessibility so it can move and focus windows.
  EOS
end
