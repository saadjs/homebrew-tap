class GhStats < Formula
  desc "Generate GitHub language stats as JSON or SVG"
  homepage "https://github.com/saadjs/gh-stats"
  version "1.0.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/gh-stats/releases/download/v1.0.2/gh-stats_1.0.2_darwin_arm64.tar.gz"
      sha256 "ed2c3ef3b878909dc0854e8b31dfde02a40ee0add2136da772fd4999c53a59bd"
    else
      url "https://github.com/saadjs/gh-stats/releases/download/v1.0.2/gh-stats_1.0.2_darwin_amd64.tar.gz"
      sha256 "75d85a89ae32e7770e07d380cffe859465bb24e0acb2e7f559b03e384a4aa846"
    end
  end

  on_linux do
    url "https://github.com/saadjs/gh-stats/releases/download/v1.0.2/gh-stats_1.0.2_linux_amd64.tar.gz"
    sha256 "7a47c15fca6fbcb9f92dfc95d9b10909bc99dc91945781c3480231caf0307274"
  end

  def install
    bin.install "gh-stats"
  end

  test do
    assert_match "gh-stats", shell_output("#<built-in function bin>/gh-stats --help")
  end
end
