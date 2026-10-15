class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.23"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.23/bitty-x86_64-apple-darwin"
    sha256 "4e98c572bd993e03199b45d59a95681b46d640a01179f492c237d5c9c5b3a64e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.23/bitty-aarch64-apple-darwin"
    sha256 "8d6f42cff8c902497f91121024e8fab2890ce82a22154a77ba9efdf726403dfb"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.23", shell_output("#{bin}/bitty --version")
  end
end
