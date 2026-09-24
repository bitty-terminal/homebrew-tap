class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.21"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.21/bitty-x86_64-apple-darwin"
    sha256 "104de682d92b09c8c449de92b5b091cf095f28cc15c7f8a87e201bc7472f20e3"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.21/bitty-aarch64-apple-darwin"
    sha256 "66089ec34c6733c52cbea5ca35671f9b54efa6dceefbbdca1536ecdae8751d4c"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.21", shell_output("#{bin}/bitty --version")
  end
end
