class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.24"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.24/bitty-x86_64-apple-darwin"
    sha256 "772bd9e7fcf2d3e64fed7c6f1241a3abd9da237e6540a7ede82fd375343ec3aa"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.24/bitty-aarch64-apple-darwin"
    sha256 "88ff8a49211f3d9d4cccfd0a5894670a7c668900dc8922e7d982bbf855e3f0e8"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.24", shell_output("#{bin}/bitty --version")
  end
end
