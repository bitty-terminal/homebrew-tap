class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.44"
  license any_of: ["MIT", "Apache-2.0"]

  # Primary download source: the R2-backed CDN. The same bytes are published
  # on GitHub Releases, documented here as the fallback:
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.44/bitty-x86_64-apple-darwin
  #   https://github.com/bitty-terminal/bitty/releases/download/v0.0.44/bitty-aarch64-apple-darwin
  if OS.mac? && Hardware::CPU.intel?
    url "https://cdn.bitty.run/releases/v0.0.44/bitty-x86_64-apple-darwin"
    sha256 "1259b8f80b2a85ebb5b437062828e772d6d7649fabc994b6023384be618ce534"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://cdn.bitty.run/releases/v0.0.44/bitty-aarch64-apple-darwin"
    sha256 "6929392e62d264d34602f456f0b1bb3dca381b439e7aafcb858edbdbba54437a"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.44", shell_output("#{bin}/bitty --version")
  end
end
