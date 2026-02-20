class Kcal < Formula
  desc "Local-first calorie, macro, and nutrient tracking CLI"
  homepage "https://github.com/saadjs/kcal-cli"
  version "1.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.1/kcal-darwin-arm64"
      sha256 "f6c699a3787528ee06da7d225453f970a176b48e2a30a303d3cf99890baf17d8"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.1/kcal-darwin-amd64"
      sha256 "e63c943d90d48d52fe5d212a8aa3cc0b08980bb45c0171158f7824a900d4f753"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.1/kcal-linux-arm64"
      sha256 "852d88a48e41e09340d56f85ad28ada7b31b9cd1aa5bdaf24c85fadacd925675"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.1.1/kcal-linux-amd64"
      sha256 "4c9f907a3798e33c4fa9badaa0a8174a9a78022f6e6f1a5d081f56a654efbe31"
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
