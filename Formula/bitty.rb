class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.17"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.17/bitty-x86_64-apple-darwin"
    sha256 "e1e45b4a4d0b04c858ece622d35dc4f9ba8568abbb7edac682fda57d1b8f87ef"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.17/bitty-aarch64-apple-darwin"
    sha256 "d56554c5f6b61017ed83d87792db73cf9dfbaa6a3523b9532f8bff21053013cc"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.17", shell_output("#{bin}/bitty --version")
  end
end
