class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.22"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.22/bitty-x86_64-apple-darwin"
    sha256 "e5849c0db968aef1a0f936594043a18c0d0770156e816dc3f98de6308bdcb843"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.22/bitty-aarch64-apple-darwin"
    sha256 "5677731f7632c9967f6ca73ad85dbe96fd34548ad298cea6e4bbca1422179f7b"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.22", shell_output("#{bin}/bitty --version")
  end
end
