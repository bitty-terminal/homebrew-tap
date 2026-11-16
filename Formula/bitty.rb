class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.43"
  license any_of: ["MIT", "Apache-2.0"]

  # Primary download source: the R2-backed CDN. The same bytes are published
  # on GitHub Releases, documented here as the fallback:
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.43/bitty-x86_64-apple-darwin
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.43/bitty-aarch64-apple-darwin
  if OS.mac? && Hardware::CPU.intel?
    url "https://cdn.bitty.run/releases/v0.0.43/bitty-x86_64-apple-darwin"
    sha256 "e490a592f123bd3d20112fccd60b6adfd27bbf4dd9d5e8cc1cd654766b821e72"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://cdn.bitty.run/releases/v0.0.43/bitty-aarch64-apple-darwin"
    sha256 "027e73173bb8ceaaaec84e5bfcca43202bd2ace4fcf3479f6d05dc827f1630f6"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.43", shell_output("#{bin}/bitty --version")
  end
end
