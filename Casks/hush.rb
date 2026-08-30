# frozen_string_literal: true

cask "hush" do
  version "2026.08.30"
  sha256 "92e1c931305eba0a37af0c1dc88a8719ed11451f4d0a0d46c75f86bf59fc3785"

  url "https://github.com/saadjs/hush/releases/download/v#{version}/Hush-#{version}.zip"
  name "Hush"
  desc "Safari content blocker that blocks ads and nothing else"
  homepage "https://github.com/saadjs/hush"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Hush.app"

  # Safari re-reads the extension on relaunch, so upgrades need the old copy closed.
  uninstall quit: "sh.saad.hush"

  zap trash: [
    "~/Library/Containers/sh.saad.hush",
    "~/Library/Containers/sh.saad.hush.ContentBlocker",
  ]

  caveats <<~EOS
    Open Hush once so Safari registers the content blocker, then enable Hush
    under Safari → Settings → Extensions.

    Safari counts every copy of the app on disk. If Hush reports that it cannot
    read Safari's setting, delete any other Hush.app — an Xcode build, say —
    and reopen the one in /Applications.
  EOS
end
