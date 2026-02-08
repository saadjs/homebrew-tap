class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/agent-skills"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/agent-skills/releases/download/v1.0.0/skillctl_1.0.0_darwin_arm64.tar.gz"
      sha256 "b0f0919f744798d04d0eb78c5a9e09e1aa59c3316b1bc69b599fae7a6d5359ee"
    else
      url "https://github.com/saadjs/agent-skills/releases/download/v1.0.0/skillctl_1.0.0_darwin_amd64.tar.gz"
      sha256 "dc6f6a93b4501ecad4a1bfb11454294370739c6ee8169674a2078487c185134a"
    end
  end

  on_linux do
    url "https://github.com/saadjs/agent-skills/releases/download/v1.0.0/skillctl_1.0.0_linux_amd64.tar.gz"
    sha256 "be759e9f9d9a7cd1d3e9bb4f4ef34faff11e8e219f1c458f494978105333f232"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#<built-in function bin>/skillctl --help")
  end
end
