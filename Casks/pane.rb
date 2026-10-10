# frozen_string_literal: true

cask "pane" do
  version "0.1.0"
  sha256 "cfcc14496a35bada0a479dff711f925fdd82ea4b76602e9ddb9585ddb8785028"

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
    "~/Library/Application Support/sh.saad.pane",
    "~/Library/Preferences/sh.saad.pane.plist",
  ]

  caveats <<~EOS
    Open Pane, choose Open Settings…, and turn on Pane under
    Privacy & Security → Accessibility so it can move and focus windows.
  EOS
end
