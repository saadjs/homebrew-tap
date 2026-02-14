class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/agent-skills"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/agent-skills/releases/download/v1.1.0/skillctl_1.1.0_darwin_arm64.tar.gz"
      sha256 "3271360331b234473030280b6dfef6dcd6e30075760a46b423a5bd6e2afc2059"
    else
      url "https://github.com/saadjs/agent-skills/releases/download/v1.1.0/skillctl_1.1.0_darwin_amd64.tar.gz"
      sha256 "7b22305e28bd0289df7d08e408995aad8845e9315eaeee57f3b5311ead3e4dbc"
    end
  end

  on_linux do
    url "https://github.com/saadjs/agent-skills/releases/download/v1.1.0/skillctl_1.1.0_linux_amd64.tar.gz"
    sha256 "34a32a9dc0cb7d0650b0f5c89bb92c0bd9461d75e12033b47b03bd8dabac3712"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#<built-in function bin>/skillctl --help")
  end
end
