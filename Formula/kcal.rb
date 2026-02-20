class Kcal < Formula
  desc "Local-first calorie, macro, and nutrient tracking CLI"
  homepage "https://github.com/saadjs/kcal-cli"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-darwin-arm64"
      sha256 "6164db35cdfaf9fb680dfb6f6b1b366540234984c7a4ffcf0ed1d5c506c326d5"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-darwin-amd64"
      sha256 "9dccdb5bed6fc6230d5c7a973bfa49ed80ea0f6a2e00e115c850dca9379a586b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-linux-arm64"
      sha256 "c0cabd36f7810512db92099233db37b213b5402419128f9d6b083ebaee077544"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-linux-amd64"
      sha256 "cbe86b30059dd090a5ec91e2ced8a7ed615360a2fa94a04857ef658ebf3379d6"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "kcal-darwin-arm64" => "kcal"
      else
        bin.install "kcal-darwin-amd64" => "kcal"
      end
    elsif OS.linux?
      if Hardware::CPU.arm?
        bin.install "kcal-linux-arm64" => "kcal"
      else
        bin.install "kcal-linux-amd64" => "kcal"
      end
    end
  end

  test do
    assert_match "kcal", shell_output("#{bin}/kcal --help")
  end
end
