class Gitvista < Formula
  desc "Real-time local Git repository visualization"
  homepage "https://gitvista.io"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_darwin_arm64.tar.gz"
        sha256 "6d23afae8fdeac84e96df95363cf0acc730e53ce"
      elsif Hardware::CPU.intel?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_darwin_amd64.tar.gz"
        sha256 "9b9c35d9038f250d49319668cdb58ae8105a7e4e"
      end
    end

    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_linux_arm64.tar.gz"
        sha256 "b851133b86de9b6403e609ba7375473272b54277"
      elsif Hardware::CPU.intel?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_linux_amd64.tar.gz"
        sha256 "1c459634b0d2a7ffdf9afea657ff3f67a30d79ec"
      end
    end

    def install
      bin.install "gitvista"
      bin.install_symlink bin/"gitvista" => "git-vista"
    end

    test do
      assert_match "GitVista", shell_output("#{bin}/gitvista help")
      assert_match "GitVista", shell_output("#{bin}/git-vista help")
    end
  end
