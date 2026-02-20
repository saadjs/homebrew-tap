class Kcal < Formula
  desc "Local-first calorie, macro, and nutrient tracking CLI"
  homepage "https://github.com/saadjs/kcal-cli"
  version "1.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.0/kcal-darwin-arm64"
      sha256 "2c3461a279dd9590f3bdcfdc23761bad8222b3f4f89fbeb0aac34192d10faac7"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.0/kcal-darwin-amd64"
      sha256 "d3455dd563481be27a53f45ba5f08f3fc7e0f7bdd0fc107426e2e94af58cf768"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.0/kcal-linux-arm64"
      sha256 "a5648088523cac4b8bf1c6ed43fff5577d7228c02c1c0ac83cbb3fec1afefb60"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.0/kcal-linux-amd64"
      sha256 "69d3a768a39701fb68da87a4c04a9a70f2035e134d2bb98a4d5472102a81f8b5"
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
