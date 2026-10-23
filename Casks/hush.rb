# frozen_string_literal: true

cask "hush" do
  version "2026.10.23"
  sha256 "691cadd9e66914ba1454fc9017bfb745995c93c2b29fd5cb3bb0012b2ffcff4b"

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
