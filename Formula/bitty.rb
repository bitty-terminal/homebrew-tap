class Bitty < Formula
  desc "Bitty pre-alpha terminal workspace minimal correct terminal"
  homepage "https://github.com/bitty-terminal/bitty"
  version "0.0.23"
  license any_of: ["MIT", "Apache-2.0"]

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.23/bitty-x86_64-apple-darwin"
    sha256 "0d51baa6c59676a49342acd3ea933a86602c0550e9ec2fe8e458250a8f691add"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/bitty-terminal/bitty/releases/download/v0.0.23/bitty-aarch64-apple-darwin"
    sha256 "42991ad682161af28c42e570528fd139e42ae4acdc6e577fb5257a4d8e6fe164"
  end

  def install
    bin.install "bitty-x86_64-apple-darwin" => "bitty" if Hardware::CPU.intel?
    bin.install "bitty-aarch64-apple-darwin" => "bitty" if Hardware::CPU.arm?
  end

  test do
    assert_match "0.0.23", shell_output("#{bin}/bitty --version")
  end
end
