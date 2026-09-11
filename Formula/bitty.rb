class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.20"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.20/bitty-x86_64-apple-darwin"
    sha256 "2b33b44e31eb14a40554d279b2657123c9af49107a0cac4e13bcecae321ef08d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.20/bitty-aarch64-apple-darwin"
    sha256 "304cc2d469c1d4015ad17dde5f30cbe4cb52484b811d78996042c986fedf3540"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.20", shell_output("#{bin}/bitty --version")
  end
end
