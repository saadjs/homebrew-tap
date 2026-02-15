class GhStats < Formula
  desc "Generate GitHub language stats as JSON or SVG"
  homepage "https://github.com/saadjs/gh-stats"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/gh-stats/releases/download/v1.1.0/gh-stats_1.1.0_darwin_arm64.tar.gz"
      sha256 "087846b04f85ba49a2c594e17eeb02698369c2fe748b8b343122650cf1f2e6e7"
    else
      url "https://github.com/saadjs/gh-stats/releases/download/v1.1.0/gh-stats_1.1.0_darwin_amd64.tar.gz"
      sha256 "a585814f78b24f20d088e363f5edc9ef9f16928a68124229cb88e13c45ad7ff3"
    end
  end

  on_linux do
    url "https://github.com/saadjs/gh-stats/releases/download/v1.1.0/gh-stats_1.1.0_linux_amd64.tar.gz"
    sha256 "f4282bc7b0384c400ee3604bc73a20e566c64213afb138a4669b5c589ce5cda9"
  end

  def install
    bin.install "gh-stats"
  end

  test do
    system "\#<built-in function bin>/gh-stats", "--help"
  end
end
