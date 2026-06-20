class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/skillctl"
  version "1.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/skillctl/releases/download/v1.3.0/skillctl_1.3.0_darwin_arm64.tar.gz"
      sha256 "01eef351c4372bd6431439580261ce8b37f32c1b233103cdb748d13e67b37f0e"
    else
      url "https://github.com/saadjs/skillctl/releases/download/v1.3.0/skillctl_1.3.0_darwin_amd64.tar.gz"
      sha256 "1daf86842960143c3d25ecc7e25849ae89911e15231c078a68db54718af7087d"
    end
  end

  on_linux do
    url "https://github.com/saadjs/skillctl/releases/download/v1.3.0/skillctl_1.3.0_linux_amd64.tar.gz"
    sha256 "bd11be6b79094f4d4c28b521c6fc0137b3d3ad7edeb518555ec55becb1643b5e"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#<built-in function bin>/skillctl --help")
  end
end
