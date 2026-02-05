class GhStats < Formula
  desc "Generate GitHub language stats as JSON or SVG"
  homepage "https://github.com/saadjs/gh-stats"
  url "https://registry.npmjs.org/@saadjs/gh-stats/-/gh-stats-1.0.0.tgz"
  sha256 "b274e270e6930e78c84dd615c261894fa6a448d98f2ce0d6fa890091cfd7105e"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
  end

  test do
    assert_match "gh-stats", shell_output("#{bin}/gh-stats --help")
  end
end
