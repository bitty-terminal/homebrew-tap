class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.31"
  license any_of: ["MIT", "Apache-2.0"]

  # Primary download source: the R2-backed CDN. The same bytes are published
  # on GitHub Releases, documented here as the fallback:
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.31/bitty-x86_64-apple-darwin
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.31/bitty-aarch64-apple-darwin
  if OS.mac? && Hardware::CPU.intel?
    url "https://cdn.bitty.run/releases/v0.0.31/bitty-x86_64-apple-darwin"
    sha256 "79f4bb7f9dc021ee5cfa2adbb6a1ae46f7886848366c3355621df47df9d40a04"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://cdn.bitty.run/releases/v0.0.31/bitty-aarch64-apple-darwin"
    sha256 "d64fcaf34f54cb1865a7a60112aa83010b1a0c51c3e447086beec7347bd3c82a"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.31", shell_output("#{bin}/bitty --version")
  end
end
