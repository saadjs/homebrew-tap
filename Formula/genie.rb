class Genie < Formula
  desc "Translate plain English into shell commands"
  homepage "https://github.com/saadjs/genie-cli"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/genie-cli/releases/download/v0.1.0/genie_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/saadjs/genie-cli/releases/download/v0.1.0/genie_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/genie-cli/releases/download/v0.1.0/genie_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/saadjs/genie-cli/releases/download/v0.1.0/genie_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "genie"
  end

  test do
    assert_match "genie", shell_output("#{bin}/genie --version")
  end
end
