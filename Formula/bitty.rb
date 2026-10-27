class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.30"
  license any_of: ["MIT", "Apache-2.0"]

  # Primary download source: the R2-backed CDN. The same bytes are published
  # on GitHub Releases, documented here as the fallback:
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.30/bitty-x86_64-apple-darwin
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.30/bitty-aarch64-apple-darwin
  if OS.mac? && Hardware::CPU.intel?
    url "https://cdn.bitty.run/releases/v0.0.30/bitty-x86_64-apple-darwin"
    sha256 "a0384e78859347bf441fd132dbf25b6f5f0a8451a87d27f8cc185b4c56df0cc6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://cdn.bitty.run/releases/v0.0.30/bitty-aarch64-apple-darwin"
    sha256 "19a5e621f85ba8374958aa7362ec01480f9779c3633bf3e7ac95417f715caba6"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.30", shell_output("#{bin}/bitty --version")
  end
end
