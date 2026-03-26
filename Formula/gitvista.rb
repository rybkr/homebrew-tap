class Gitvista < Formula
  desc "Real-time local Git repository visualization"
  homepage "https://gitvista.io"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_darwin_arm64.tar.gz"
        sha256 "1e5a06c73cf11d995c9a673490ac07d65595e11bb022eb585666b18ed3417ff7"
      elsif Hardware::CPU.intel?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_darwin_amd64.tar.gz"
        sha256 ""
      end
    end

    on_linux do
      if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_linux_arm64.tar.gz"
        sha256 ""
      elsif Hardware::CPU.intel?
        url "https://github.com/rybkr/gitvista/releases/download/v#{version}/gitvista_#{version}_linux_amd64.tar.gz"
        sha256 ""
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
