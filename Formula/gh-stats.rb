class GhStats < Formula
  desc "Generate GitHub language stats as JSON or SVG"
  homepage "https://github.com/saadjs/gh-stats"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/gh-stats/releases/download/v1.2.0/gh-stats_1.2.0_darwin_arm64.tar.gz"
      sha256 "5e4ad048f8ea2b6c17e2158e16f5011fa531d8fb9e35d53519620a606a0ba770"
    else
      url "https://github.com/saadjs/gh-stats/releases/download/v1.2.0/gh-stats_1.2.0_darwin_amd64.tar.gz"
      sha256 "950767a0eea3cb307e568ed04bce5c9cb4d3799b177877e5e5aaa19a1e9c726b"
    end
  end

  on_linux do
    url "https://github.com/saadjs/gh-stats/releases/download/v1.2.0/gh-stats_1.2.0_linux_amd64.tar.gz"
    sha256 "b112f4f4c4885c5445ade6699b40138a56695a39cc21ce0751d7ba168c770e93"
  end

  def install
    bin.install "gh-stats"
  end

  test do
    system "\#<built-in function bin>/gh-stats", "--help"
  end
end
