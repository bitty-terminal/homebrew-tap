class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.34"
  license any_of: ["MIT", "Apache-2.0"]

  # Primary download source: the R2-backed CDN. The same bytes are published
  # on GitHub Releases, documented here as the fallback:
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.34/bitty-x86_64-apple-darwin
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.34/bitty-aarch64-apple-darwin
  if OS.mac? && Hardware::CPU.intel?
    url "https://cdn.bitty.run/releases/v0.0.34/bitty-x86_64-apple-darwin"
    sha256 "b4b99c642323ef039ef043a76952ed5ddac9b592c3ba1a68cacf12f8fecdbaa9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://cdn.bitty.run/releases/v0.0.34/bitty-aarch64-apple-darwin"
    sha256 "d8a0cfadb380d67075935491ab368204d54af07f4175d3e836a7d4c2a4388b85"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.34", shell_output("#{bin}/bitty --version")
  end
end
