class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.19"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.19/bitty-x86_64-apple-darwin"
    sha256 "662cc764f753f5562d9189d2b651aef9f25ed6f4be0a94188f39438c70756594"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.19/bitty-aarch64-apple-darwin"
    sha256 "c95329691bf3395a89b06a44f53e3211c749944bc04fc95d6c1251955684efea"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.19", shell_output("#{bin}/bitty --version")
  end
end
