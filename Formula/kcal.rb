class Kcal < Formula
  desc "Local-first calorie, macro, and nutrient tracking CLI"
  homepage "https://github.com/saadjs/kcal-cli"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-darwin-arm64"
      sha256 "4ededb46dad8445609f94c192efdf4a4c24aaf9c8694ae68e436c02229349d9f"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-darwin-amd64"
      sha256 "43348f4801699a020d64652074c26c21f8b297a9c4c149a69113f438dfc20fda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-linux-arm64"
      sha256 "4ca5b9629f1849682f38ba9fda373f285ed23f09108c51d911bd615e9c2a65fb"
    else
      url "https://github.com/saadjs/kcal-cli/releases/download/v1.0.0/kcal-linux-amd64"
      sha256 "943a67cdd47afdc6cba064ab7767dd4c8268d4ba3090c3cd6e550be1b84dc39f"
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
