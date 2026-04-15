class Skillctl < Formula
  desc "Install and manage agent skills"
  homepage "https://github.com/saadjs/agent-skills"
  version "1.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/agent-skills/releases/download/v1.2.0/skillctl_1.2.0_darwin_arm64.tar.gz"
      sha256 "acb99d51d4061c6a866bcf69f5539c2d68ab3ffe57a42c63023dc62c512a448b"
    else
      url "https://github.com/saadjs/agent-skills/releases/download/v1.2.0/skillctl_1.2.0_darwin_amd64.tar.gz"
      sha256 "e4a98d11c9181903b3f3b384d6e6d1f1500b5256f13555e6891a7daf005f187b"
    end
  end

  on_linux do
    url "https://github.com/saadjs/agent-skills/releases/download/v1.2.0/skillctl_1.2.0_linux_amd64.tar.gz"
    sha256 "2bfd6129ec789415a57d93fc2d259767e9baa449a1ae47c1f4f9724b87be0500"
  end

  def install
    bin.install "skillctl"
  end

  test do
    assert_match "skillctl", shell_output("#<built-in function bin>/skillctl --help")
  end
end
