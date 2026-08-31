# frozen_string_literal: true

cask "octobase" do
  version "1.0.1"
  sha256 "875ea41abaeaa5c8f46af5cd86509af70413bd5fcfcc0274087237ca349a645d"

  url "https://github.com/saadjs/octobase/releases/download/v#{version}/octobase-#{version}-safari.zip"
  name "Octobase"
  desc "Safari extension replacing the GitHub homepage with an actionable dashboard"
  homepage "https://github.com/saadjs/octobase"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "Octobase Direct.app"

  zap trash: [
    "~/Library/Containers/sh.saad.octobase.direct",
    "~/Library/Containers/sh.saad.octobase.direct.Extension",
    "~/Library/HTTPStorages/sh.saad.octobase.direct",
    "~/Library/Preferences/sh.saad.octobase.direct.plist",
    "~/Library/Saved Application State/sh.saad.octobase.direct.savedState",
  ]

  caveats <<~EOS
    Open Octobase Direct once so Safari registers the extension, then enable
    Octobase under Safari → Settings → Extensions.
  EOS
end
