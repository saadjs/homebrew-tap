class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/agent-skills"
  version "0.1.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/agent-skills/releases/download/v0.1.3/skillctl_0.1.3_darwin_arm64.tar.gz"
      sha256 "d2557f31c53cba7a53fabc25d819373f8fe056277fe6a55118a5346a8c5f9c48"
    else
      url "https://github.com/saadjs/agent-skills/releases/download/v0.1.3/skillctl_0.1.3_darwin_amd64.tar.gz"
      sha256 "aef4445c85609521d3dd7b05eab1217d856aa51a72ea26541807fc3fd0cd27fe"
    end
  end

  on_linux do
    url "https://github.com/saadjs/agent-skills/releases/download/v0.1.3/skillctl_0.1.3_linux_amd64.tar.gz"
    sha256 "152fa8edbd678d1155c7480ff13f5f9e3ff24087c867a4f633a781c7c2026464"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#<built-in function bin>/skillctl --help")
  end
end
