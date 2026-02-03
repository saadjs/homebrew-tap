class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/agent-skills"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/agent-skills/releases/download/v0.1.2/skillctl_0.1.2_darwin_arm64.tar.gz"
      sha256 "b53a4682e4c0cf5f83e0d74cd37d69cdc0fbfe32c05c53523344ebeb58639775"
    else
      url "https://github.com/saadjs/agent-skills/releases/download/v0.1.2/skillctl_0.1.2_darwin_amd64.tar.gz"
      sha256 "c36ff560ca42dd08f7ba9552722903bcdf86ce347ae8ff37897682620811e020"
    end
  end

  on_linux do
    url "https://github.com/saadjs/agent-skills/releases/download/v0.1.2/skillctl_0.1.2_linux_amd64.tar.gz"
    sha256 "4ce739aac7b967ee81e988a5c46906bc5130e4025eed82b7ed88edc2c5b613ff"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#{bin}/skillctl --help")
  end
end
